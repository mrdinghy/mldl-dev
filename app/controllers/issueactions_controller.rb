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
    issue = Issue.find(params[:issue_id])
    @issueaction.issue_id = params[:issue_id]
    @issueaction.structure_id = issue.structure_id
    @issueaction.actiontype = params[:actiontype] if params[:actiontype]
    @issueaction.meeting_id = params[:meeting_id] if params[:meeting_id]
    @issueaction.mediation_id = params[:mediation_id] if params[:mediatiion_id]

    if params[:meeting_id]

           if @issueaction.meeting_result_escalated?   #escalate from meeting
               @issueaction.laststructure_id = params[:issue_id]
               issue.structure_id = params[:parent_id]
            end

            if @issueaction.meeting_result_resolved?  #resovled from meeting
              issue.resolution_date = DateTime.now
              issue.resolution = params[:issueaction][:actionbody]

            end
            if @issueaction.meeting_result_ongoing?  #unresolved - remains open

            end


            if @issueaction.meeting_result_mediation? #INTO MEDIATION from meeting

            end

            if @issueaction.meeting_result_cancelled?  #cancelled from meeting
              issue.cancelled_at = DateTime.now

            end

  elsif params[:mediation_id]


    if @issueaction.mediation_result_escalated?   #escalate from meeting
      @issueaction.laststructure_id = params[:issue_id]
      issue.structure_id = params[:parent_id]
    end

    if @issueaction.mediation_result_resolved?  #resovled from meeting
      issue.resolution_date = DateTime.now
      issue.resolution = params[:issueaction][:actionbody]

    end
    if @issueaction.mediation_result_ongoing?  #unresolved - remains open

    end



    if @issueaction.mediation_result_cancelled?  #cancelled from meeting
      issue.cancelled_at = DateTime.now

    end



  else
          if @issueaction.comment?   #create Note

          end
          if @issueaction.escalated?   #escalate ISSUE
            @issueaction.laststructure_id = issue.id
            issue.structure_id = params[:parent_id]
          end

          if @issueaction.resolved?  #resovled ISSUE
            issue.resolution_date = DateTime.now
            issue.resolution = params[:issueaction][:actionbody]
          end

          if @issueaction.cancelled?  #cancelled ISSUE
            issue.cancelled_at = DateTime.now
          end
          if @issueaction.reopened?  #REOPEN ISSUE
            @issueaction.old_resolution_date = issue.resolution_date
            issue.resolution_date = nil
            issue.cancelled_at = nil
          end

          if @issueaction.mediation?  #INTO MEDIATION
          end

    end
   issue.save
   @issueaction.save


    respond_to do |format|
      if @issueaction.save

     if params[:meeting_id]
       meet = Meeting.find(params[:meeting_id])
       format.html { redirect_to meet, notice: 'issueaction was successfully created.' }
     else
       format.html { redirect_to issue, notice: 'issueaction was successfully created.' }
     end




        format.json { render :show, status: :created, location: @issueaction }
      else
        format.html { render :new }
        format.json { render json: @issueaction.errors, status: :unprocessable_entity }
      end
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
