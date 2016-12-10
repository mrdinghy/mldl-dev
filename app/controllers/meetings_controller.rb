class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show

    if @meeting.structure.ismanager(current_user.id) or current_user.mldlrole == 1
      @canedit = true
    end
    @myagendas = Agenda.where(meeting_id: @meeting.id)
    @unheardagendas = Agenda.where('meeting_id =? and (addressed is null or addressed = ?)', @meeting.id, :false).count
    @participants = Participation.where('meeting_id = ?', @meeting.id)
    @myparent = Structure.find(@meeting.structure.parent_id)
    @participation = Participation.new
    @available_people = Person.all
    @issue = Issue.new
    @issueaction = Issueaction.new
    @meetingdocs = SiteDocument.where('documentable_type = ? and documentable_id = ?', 'meeting', @meeting.id)
    @new_site_document = SiteDocument.new


    @pdfname = 'mldl_meeting_' + @meeting.id.to_s

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: @pdfname
        # pdf = IssuePdf.new(@issue)
        #send_data pdf.render, filename: "order_#{@issue.issuecode}.pdf",
        #         type: "application/pdf",
        #        disposition: "inline"
      end
    end








  end



  def searchmeetings

    @allstructures = Structure.order(:id)
    @allpersons = Person.all


  end

  def meetingresults

    searchterm = params[:search_term]
    searchresults = Meeting.all

    searchresults = Meeting.where('structure_id in (?)', params[:structure_ids]) if !params[:structure_ids].blank?

    #searchresults = Meeting.where('name like ? or description like ? or community like  ? ', "%#{searchterm}%", "%#{searchterm}%", "%#{searchterm}%") if !params[:search_term].blank?

    @Meetings = searchresults
    render 'index'
  end















  # GET /meetings/new
  def new
    @meeting = Meeting.new
    @meeting.structure_id = params[:structure_id] if params[:structure_id]
    @openissues = Issue.where(structure_id: @meeting.structure_id, status: Status::ONGOING)
  end

  # GET /meetings/1/edit
  def edit

    agendaissueids = Agenda.where(meeting_id: @meeting.id).pluck(:issue_id)

    @openissues = Issue.where('(structure_id = ? and (status = ? or status = ?)) or id in (?)',  @meeting.structure_id, Status::NEW, Status::ONGOING, agendaissueids )
  end

  # POST /meetings
  # POST /meetings.json
  def create

    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        Userlog.create(user_id: current_user.id, loggable_type: 'Meeting', loggable_id: @meeting.id, action: 'Create')
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update

 puts params[:meeting][:issue_ids]


 if params[:meeting][:issue_ids]

   issuesadded =params[:meeting][:issue_ids].reject { |e| e.to_s.empty? }
   Issueaction.where('actiontype = ? and meeting_id = ? and issue_id in (?)', Actiontype::AGENDA, params[:id], issuesadded).destroy_all


   issuesadded.each do |i|

      Issueaction.create(meeting_id: @meeting.id, structure_id: @meeting.structure_id, issue_id: i, actiontype: Actiontype::AGENDA)
    end
  end

    respond_to do |format|
      if @meeting.update(meeting_params)
        Userlog.create(user_id: current_user.id, loggable_type: 'Meeting', loggable_id: @meeting.id, action: 'Update')
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def addparticipant



    @participant = Participation.new
    meeting=Meeting.find(params[:meeting_id])
    @participant.meeting_id = meeting.id
    if params[:addpeep]
      peep=Person.create(name_first: params[:fname], name_last: params[:lname], email: params[:email], title: params[:title], organization_id: params[:organization_id])
      @participant.person_id = peep.id
    else
      @participant.person_id = params[:person_id]
    end

    respond_to do |format|
      if @participant.save
        format.html { redirect_to meeting, notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @participation }
      else
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end




  end

  def blankmeeting
    @structure= Structure.find(params[:structure_id])

  @pdfname = 'mldl_meeting_template'

  respond_to do |format|
    format.html
    format.pdf do
      render pdf: @pdfname
      # pdf = IssuePdf.new(@issue)
      #send_data pdf.render, filename: "order_#{@issue.issuecode}.pdf",
      #         type: "application/pdf",
      #        disposition: "inline"
    end
  end






end







  def deleteparticipation
    p=Participation.find(params[:participation_id]).destroy
    m = Meeting.find(p.meeting_id)
    respond_to do |format|
      format.html { redirect_to m, notice: 'Meeting Participant has been removed.' }
      format.json { head :no_content }
    end
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:meeting_on, :structure_id, :location, :duration, :starts_at, :meeting_held, :closenote, :reopennote, issue_ids: [])
    end
end
