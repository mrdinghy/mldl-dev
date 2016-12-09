class IssueactionsController < ApplicationController
  before_action :set_issueaction, only: [:show, :edit, :update, :destroy]

  # GET /issueactions
  # GET /issueactions.json
  def index
    @issueactions = Issueaction.all
  end

  # GET /issueactions/1
  # GET /issueactions/1.json
  def show
  end

  # GET /issueactions/new
  def new
    @issueaction = Issueaction.new
  end

  # GET /issueactions/1/edit
  def edit
  end

  # POST /issueactions
  # POST /issueactions.json


  def create
    @issueaction = Issueaction.new(issueaction_params)
    @issueaction.update_attributes!(:user_id => current_user.id)
    @issue = Issue.find(params[:issueaction][:issue_id])


    if params[:issueaction][:meeting_id].present?
        @meeting = Meeting.find(params[:issueaction][:meeting_id])
        goto = @meeting
        if !params[:agenda_id].nil? and !params[:agenda_id].blank?
          @agenda = Agenda.find(params[:agenda_id])
        end


    elsif params[:issueaction][:mediation_id].present?

      @issueaction.update_attributes!(:mediation_id => params[:issueaction][:mediation_id])

       @mediation = Mediation.find(params[:issueaction][:mediation_id])
       goto = @mediation



    else
       goto = @issue
    end


      #create AGenda------------------------------------------------

   if @issueaction.agenda?


        if @issueaction.save
          @agenda = Agenda.create(issue_id: params[:issueaction][:issue_id], meeting_id: params[:issueaction][:meeting_id])
        end


      #create Comment ------------------------------------------------------------
    elsif @issueaction.comment?
      if params[:issueaction][:actionbody].blank?
        flash[:error] = 'No comment provided. Not saved'
        nocomment = 1
      else
        if @issueaction.save
           sendnotice = 'Comment Saved Successuflly'
        end

      end




      #create ongoing----------------------------------------------------

    elsif @issueaction.ongoing?
      @issue.update_attributes!(status: Status::ONGOING)


      if @issueaction.save
        if !params[:issueaction][:meeting_id].nil? and !params[:issueaction][:meeting_id].blank?
          @agenda.update_attributes!(:result => Result::ONGOING, :addressed => true)
        elsif !params[:issueaction][:mediation_id].nil? and !params[:issueaction][:mediation_id].blank?
          d2 = Date.parse(params[:mediate_end])
          @mediation.update_attributes!(:result => Result::ONGOING, :mediate_end => d2, :mediation_held => true)
        end
        sendnotice = 'Issue Remains Open'

      end


      #create Cancelled-----------------------------------------------------

    elsif @issueaction.cancelled?
      @issue.update_attributes!(cancelled_at: DateTime.now)
      @issue.update_attributes!(status: Status::CANCELLED)


      if @issueaction.save
        if !params[:issueaction][:meeting_id].nil? and !params[:issueaction][:meeting_id].blank?
          @agenda.update_attributes!(:result => Result::CANCELLED, :addressed => true)
        elsif !params[:issueaction][:mediation_id].nil? and !params[:issueaction][:mediation_id].blank?
          d2 = Date.parse(params[:mediate_end])
          @mediation.update_attributes!(:result => Result::CANCELLED, :mediate_end => d2, :mediation_held => true)
        end
        sendnotice = 'Issue Cancelled Successfully.'

      end



      #create Referral------------------------------------------------------

    elsif @issueaction.escalated?
      @issueaction.update_attributes!(laststructure_id: @issue.structure_id)
      @issue.update_attributes!(:status => Status::ONGOING, structure_id: @issue.structure.parent_id)


      if @issueaction.save
        if !params[:issueaction][:meeting_id].nil? and !params[:issueaction][:meeting_id].blank?
          @agenda.update_attributes!(:result => Result::ESCALATED, :addressed => true)
        elsif !params[:issueaction][:mediation_id].nil? and !params[:issueaction][:mediation_id].blank?
          d2 = Date.parse(params[:mediate_end])
          @mediation.update_attributes!(:result => Result::ESCALATED, :mediate_end => d2, :mediation_held => true)
        end
        sendnotice = 'Issue Referred Up Successfully.'
      end


      #create Mediation-------------------------------------------------------

   elsif @issueaction.mediation?
     d2 = Date.parse(params[:mediate_start])
     puts 'dateparse--------------------------------'
     puts d2


      @issue.update_attributes!(:status => Status::MEDIATION)
      @mediation = Mediation.new
      @mediation.update_attributes!(:mediate_start => d2, :issue_id => params[:issueaction][:issue_id])
      @mediation.save!
     Userlog.create(user_id: current_user.id, loggable_type: 'Mediation', loggable_id: @mediation.id, action: 'Create')
      if @issueaction.save
        if !params[:issueaction][:meeting_id].nil? and !params[:issueaction][:meeting_id].blank?
          @agenda.update_attributes!(:result => Result::MEDIATION, :addressed => true)

        end
        sendnotice = 'Medation Record Created successfully.'
      end



      #create Resolution------------------------------------------------------------

   elsif @issueaction.resolved?


    @issue.update_attributes!(:status => Status::RESOLVED, resolution_date: params[:resolution_date], resolutiontype_id: params[:issueaction][:resolutiontype_id],
                              resolution_date: params[:resolution_date], resolution: params[:issueaction][:resolution])


    if @issueaction.save
        if !params[:issueaction][:meeting_id].nil? and !params[:issueaction][:meeting_id].blank?
          @agenda.update_attributes!(:result => Result::RESOLVED, :addressed => true)
          @agenda.save!


        elsif params[:issueaction][:mediation_id].present?

          d2 = Date.parse(params[:mediate_end])


          @mediation.update_attributes!(:result => Result::RESOLVED, :mediate_end => d2, :mediation_held => true)
          @issue.update_attributes(:resolution => params[:issueresolved])
          @mediation.save!


        end
        sendnotice = 'Issue Resolved successfully.'
      end




      #create REOPEN--------------------------------------------------------
      # need to save comment with Old resoltion statement and clear out current
   elsif @issueaction.reopened?



          @issueaction.update_attributes!(old_resolution_date: @issue.resolution_date)






          if @issueaction.save


            if  params[:issueaction][:mediation_id].present?


              @mediation.update_attributes(:result => Result::ONGOING, :mediate_end => nil, :mediation_held => false)
              @mediation.save!
            end


            @issue.update_attributes!(resolution_date: nil)
            @issue.update_attributes!(cancelled_at: nil)
            @issue.update_attributes!(status: Status::ONGOING)
            sendnotice = 'Issue Resolved successfully.'
          end





    end



      @issue.save!

    respond_to do |format|

      format.html { redirect_to goto, notice: 'Issue Resolved successfully.' }
      format.json { render :show, status: :created, location: @issueaction }
    end





  end







    # PATCH/PUT /issueactions/1
  # PATCH/PUT /issueactions/1.json
  def update
    respond_to do |format|
      if @issueaction.update(issueaction_params)
        format.html { redirect_to @issueaction, notice: 'Issueaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @issueaction }
      else
        format.html { render :edit }
        format.json { render json: @issueaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issueactions/1
  # DELETE /issueactions/1.json
  def destroy
    @issueaction.destroy
    respond_to do |format|
      format.html { redirect_to issueactions_url, notice: 'Issueaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issueaction
      @issueaction = Issueaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issueaction_params
      params.require(:issueaction).permit(:actiontype, :meetingresult, :mediationresult, :meeting_id, :organization_id, :issue_id, :actionbody, :structure_id, :user_id, :laststructure_id, :issue_resolution, :mediate_end)
    end
end
