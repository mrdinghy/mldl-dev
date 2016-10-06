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
    @issue = Issue.find(params[:issueaction][:issue_id])

    if !params[:issueaction][:meeting_id].nil? and !params[:issueaction][:meeting_id].blank?
        meeting = Meeting.find(params[:issueaction][:meeting_id])
    end
    if !params[:issueaction][:mediation_id].nil? and params[:issueaction][:mediation_id] > 0
       mediation = Meeting.find(params[:issueaction][:meeting_id])
    end


    if @issueaction.agenda?   #create Note
      if params[:issueaction][:meeting_id].blank?
        flash[:error] = 'When adding Issue to Meeting Agenda you need to select valid meeting-try again'
        respond_to do |format|
          format.html { redirect_to @issue }
        end
      else
        @issue.update_attributes!(:status => Status::ONGOING)
        respond_to do |format|
          if @issueaction.save
            meet = Meeting.find(params[:issueaction][:meeting_id])
            format.html { redirect_to @issue, notice: 'issueaction was successfully created.' }
            format.json { render :show, status: :created, location: @issueaction }
          end
        end
      end

    elsif @issueaction.comment?   #create Note ------------------------------------------------------------
     if params[:issueaction][:actionbody].blank?
       flash[:error] = 'No comment provided. Not saved'
        respond_to do |format|
          format.html { redirect_to @issue }
        end
      else
        respond_to do |format|
          if @issueaction.save
            format.html { redirect_to @issue, notice: 'issueaction was successfully created.' }
            format.json { render :show, status: :created, location: @issueaction }
          end
        end
      end
     elsif @issueaction.meeting_result_ongoing?  #unresolved - remains open
        @issue.update_attributes!(status: Status::ONGOING)
         respond_to do |format|
          if @issueaction.save
           format.html { redirect_to meeting, notice: 'issueaction was successfully created.' }
            format.json { render :show, status: :created, location: @issueaction }
          end
        end

    elsif @issueaction.mediation_result_ongoing?  #unresolved - remains open
      @issue.update_attributes!(status: Status::ONGOING)
      respond_to do |format|
        if @issueaction.save
          format.html { redirect_to @issue, notice: 'issueaction was successfully created.' }
          format.json { render :show, status: :created, location: @issueaction }
        end
      end

    elsif @issueaction.cancelled?  #unresolved - remains open
      @issue.update_attributes!(cancelled_at: DateTime.now)
      @issue.update_attributes!(status: Status::CANCELLED)
      respond_to do |format|
        if @issueaction.save
          format.html { redirect_to @issue, notice: 'issueaction was successfully created.' }
          format.json { render :show, status: :created, location: @issueaction }
        end
      end

    elsif @issueaction.meeting_result_cancelled?  #cancelled from meeting
      @issue.update_attributes!(cancelled_at: DateTime.now)
      @issue.update_attributes!(status: Status::CANCELLED)

      respond_to do |format|
        if @issueaction.save
          format.html { redirect_to meeting, notice: 'Mediation created successfully.' }
          format.json { render :show, status: :created, location: @issueaction }
        end
      end


    elsif @issueaction.mediation_result_cancelled?  #cancelled from meeting
      @issue.update_attributes!(cancelled_at: DateTime.now)
      @issue.update_attributes!(status: Status::CANCELLED)
      respond_to do |format|
        if @issueaction.save
          format.html { redirect_to @issue, notice: 'Mediation created successfully.' }
          format.json { render :show, status: :created, location: @issueaction }
        end
      end

     elsif @issueaction.escalated?   #create REferral------------------------------------------------------------
        @issueaction.update_attributes!(laststructure_id: @issue.structure_id)
        @issue.update_attributes!(structure_id: params[:issueaction][:parent_id])
        @issue.update_attributes!(status: Status::NEW)
       respond_to do |format|
          if @issueaction.save
           format.html { redirect_to @issue, notice: 'issueaction was successfully created.' }
            format.json { render :show, status: :created, location: @issueaction }
          end
        end

    elsif @issueaction.meeting_result_escalated?   #create meeting result REferral------------------------------------------------------------
      @issueaction.update_attributes!(laststructure_id: @issue.structure_id)
      @issue.update_attributes!(structure_id: params[:issueaction][:parent_id])
      @issue.update_attributes!(status: Status::NEW)
      respond_to do |format|
        if @issueaction.save
          format.html { redirect_to meeting, notice: 'issueaction was successfully created.' }
          format.json { render :show, status: :created, location: @issueaction }
        end
      end

    elsif @issueaction.mediation_result_escalated?   #create meeting result REferral------------------------------------------------------------
      @issueaction.update_attributes!(laststructure_id: @issue.structure_id)
      @issue.update_attributes!(structure_id: params[:issueaction][:parent_id])
      @issue.update_attributes!(status: Status::NEW)
      respond_to do |format|
        if @issueaction.save
          format.html { redirect_to @issue, notice: 'issueaction was successfully created.' }
          format.json { render :show, status: :created, location: @issueaction }
        end
      end



    elsif @issueaction.mediation?   #create REferral------------------------------------------------------------


      @issue.update_attributes!(:status => Status::MEDIATION)
    respond_to do |format|
      if @issueaction.save
        mediate = Mediation.create(issue_id: params[:issueaction][:issue_id], mediation_start: params[:mediation][:mediation_start])
        format.html { redirect_to mediate, notice: 'Mediation created successfully.' }
        format.json { render :show, status: :created, location: @issueaction }
      end
    end
    elsif @issueaction.meeting_result_mediation?   #create REferral------------------------------------------------------------
      puts 'meet med params ====================================================================================='
puts params[:issueaction][:issue_id]

      puts 'meet med params ====================================================================================='

      @issue.update_attributes!(:status => Status::MEDIATION)
      respond_to do |format|
        if @issueaction.save
          mediate = Mediation.create(issue_id: params[:issueaction][:issue_id], mediation_start: params[:mediation][:mediation_start])
          format.html { redirect_to meeting, notice: 'Mediation created successfully.' }
          format.json { render :show, status: :created, location: @issueaction }
        end
      end

    elsif @issueaction.resolved?   #create Resolution------------------------------------------------------------
      @issue.update_attributes!(:status => Status::RESOLVED, resolution_date: params[:issueaction][:resolution_date], resolutiontype_id: params[:issueaction][:resolution_date], resolution: params[:issueaction][:resolution])
         respond_to do |format|
        if @issueaction.save
          format.html { redirect_to @issue, notice: 'Issue Resolved successfully.' }
          format.json { render :show, status: :created, location: @issueaction }
        end
      end

    elsif @issueaction.meeting_result_resolved?   #create Resolution------------------------------------------------------------
      @issue.update_attributes!(:status => Status::RESOLVED, resolution_date: params[:issueaction][:resolution_date], resolutiontype_id: params[:issueaction][:resolution_date], resolution: params[:issueaction][:resolution])
      respond_to do |format|
        if @issueaction.save
          format.html { redirect_to meeting, notice: 'Issue Resolved successfully.' }
          format.json { render :show, status: :created, location: @issueaction }
        end
      end

    elsif @issueaction.mediation_result_resolved?   #create Resolution------------------------------------------------------------
      @issue.update_attributes!(:status => Status::RESOLVED, resolution_date: params[:issueaction][:resolution_date], resolutiontype_id: params[:issueaction][:resolution_date], resolution: params[:issueaction][:resolution])
      respond_to do |format|
        if @issueaction.save
          format.html { redirect_to @issue, notice: 'Issue Resolved successfully.' }
          format.json { render :show, status: :created, location: @issueaction }
        end
      end

      elsif @issueaction.reopened?  #REOPEN ISSUE
        @issueaction.update_attributes!(old_resolution_date: @issue.resolution_date)
        @issue.update_attributes!(resolution_date: nil)
        @issue.update_attributes!(cancelled_at: nil)
        @issue.update_attributes!(status: Status::ONGOING)
        respond_to do |format|
          if @issueaction.save
            format.html { redirect_to @issue, notice: 'Issue Reopened successfully.' }
            format.json { render :show, status: :created, location: @issueaction }
          end
        end




    end

@issue.save!
  end

  def createagenda

    if @issueaction.mediation?  #INTO MEDIATION
      Mediation.create(issue_id: params[:issueaction][:issue_id], mediation_start: params[:mediation][:mediation_start])
      @issue.update_attributes!(status: Status::MEDIATION)

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
      params.require(:issueaction).permit(:actiontype, :meetingresult, :mediationresult, :meeting_id, :organization_id, :issue_id, :actionbody, :structure_id, :user_id, :laststructure_id)
    end
end
