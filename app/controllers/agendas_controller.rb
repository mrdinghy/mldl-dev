class AgendasController < ApplicationController
  before_action :set_agenda, only: [:show, :edit, :update, :destroy]

  # GET /agendas
  # GET /agendas.json
  def index
    @agendas = Agenda.all
  end

  # GET /agendas/1
  # GET /agendas/1.json
  def show
  end

  # GET /agendas/new
  def new
    @agenda = Agenda.new
  end

  # GET /agendas/1/edit
  def edit
  end

  # POST /agendas
  # POST /agendas.json
  def create
    @agenda = Agenda.new(agenda_params)

    respond_to do |format|
      if @agenda.save
        format.html { redirect_to @agenda, notice: 'Agenda was successfully created.' }
        format.json { render :show, status: :created, location: @agenda }
      else
        format.html { render :new }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agendas/1
  # PATCH/PUT /agendas/1.json
  def update
    aresult = params[:agenda][:result].to_i
    puts @agenda.result
    puts 'aid----------------------------------------------------'
    puts @agenda.result
    puts 'agenda result----------------------------------------------------'
    puts params[:agenda][:result]
puts Result::CANCELLED
    if params[:agenda][:result] == Result::CANCELLED
      puts 'true'
    else
    puts 'false'
    end



    @issueaction = Issueaction.new
    @issueaction.update_attributes(user_id: params[:user_id], actionbody: params[:actionbody], meeting_id: @agenda.meeting_id, issue_id: @agenda.issue_id)
    @issue = Issue.find(@agenda.issue_id)
    @meeting = Meeting.find(@agenda.meeting_id)


    if aresult == Result::ONGOING
      @issue.update_attributes(status: Status::ONGOING)
      @issueaction.update_attributes(actiontype: Actiontype::ONGOING)
      sendnotice = 'Issue Remains Open'

    elsif aresult == Result::CANCELLED

      @issue.update_attributes(cancelled_at: DateTime.now, status: Status::CANCELLED)
      @issueaction.update_attributes(actiontype: Actiontype::CANCELLED)
      sendnotice = 'Issue Cancelled Successfully.'

    elsif aresult == Result::ESCALATED
      @issue.update_attributes(status: Status::ONGOING, structure_id: @issue.structure.parent_id)
      @issueaction.update_attributes(actiontype: Actiontype::ESCALATED, laststructure_id: @issue.structure_id)
      sendnotice = 'Issue Referred Up Successfully.'

    elsif aresult == Result::MEDIATION


      d2 = Date.parse(params[:mediate_start])
      @issue.update_attributes(status: Status::MEDIATION)
      @mediation = Mediation.new
      @mediation.update_attributes!(:mediate_start => d2, :issue_id => @issue.id)
      @mediation.save!
      Userlog.create(user_id: current_user.id, loggable_type: 'Mediation', loggable_id: @mediation.id, action: 'Create')
      @issueaction.update_attributes(actiontype: Actiontype::MEDIATION)
      sendnotice = 'Medation Record Created successfully.'

    elsif aresult == Result::RESOLVED
      @issue.update_attributes(status: Status::RESOLVED, resolution_date: params[:resolution_date], resolutiontype_id: params[:resolutiontype_id], resolution: params[:resolution])
      @issueaction.update_attributes(actiontype: Actiontype::RESOLVED)
      sendnotice = 'Issue Resolved successfully.'
    end
    @issue.save!


    respond_to do |format|
      if @agenda.update(agenda_params)
        format.html { redirect_to @meeting, notice: 'Agenda was successfully updated.' }
        format.json { render :show, status: :ok, location: @agenda }
      else
        format.html { render :edit }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agendas/1
  # DELETE /agendas/1.json
  def destroy
    @agenda.destroy
    respond_to do |format|
      format.html { redirect_to agendas_url, notice: 'Agenda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agenda
      @agenda = Agenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agenda_params
      params.require(:agenda).permit(:meeting_id, :issue_id, :result, :agenda_note, :addressed, :user_id)
    end
end
