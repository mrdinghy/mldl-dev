class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1
  # GET /issues/1.json
  def show

    if @issue.structure.ismanager(current_user.id) or current_user.mldlrole == 1
      @canedit=true
    end
    @myactions = Issueaction.where('issue_id=?', @issue.id).order('created_at DESC')
    @myagendas = Agenda.where('issue_id=?', @issue.id).order('created_at DESC')
    @mymediations = Mediation.where('issue_id=?', @issue.id).order('created_at DESC')
    @mymeetings = Meeting.where('structure_id=?', @issue.structure_id)
    @openmeetings = @mymeetings.where(meeting_held: false)
    @openagendas = Agenda.where('issue_id = ? and addressed is null', @issue.id)
    @openmediations = Mediation.where('issue_id = ? and mediate_end is null', @issue.id)

    @mydisputants = Disputant.where(issue_id: @issue.id)
    @mycommitteemembers = Committeemember.where(issue_id: @issue.id)

    @numberactions = @myactions.count
    @numbermediations = @mymediations.count
    @numberagendas = @myagendas.count
    @numberdisputants = @mydisputants.count



    @committeemember = Committeemember.new
    @disputant = Disputant.new
    @available_people = Person.all
    @available_members = Membership.where(structure_id: @issue.structure_id)


    @raisedby = Person.find(@issue.raised_by) if @issue.raised_by
    @issueaction = Issueaction.new
    @agenda = Agenda.new
    @mediation = Mediation.new
    @issuedocs = SiteDocument.where('documentable_type = ? and documentable_id = ?', 'issue', @issue.id)
    @new_site_document = SiteDocument.new
    parent_id = @issue.structure.parent_id if @issue.structure.parent_id
    @parent = Structure.find(parent_id) if parent_id
    @gapps = Appissue.where('issueid = ?', @issue.old_id)

   @pdfname = 'mldl_issue_' + @issue.id.to_s

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

  def issuedump
    @sheetname = "MLDL Issues - All Structures"
    @issues = Issue.all
    render xlsx:'issues', template: 'issues/issuedump.xlsx.axlsx', filename: "mldlissues.xlsx"
  end


  def searchbyqtr
    @yloop = [2013,2014,2015,2016,2017]
    @qloop = [1,4,7,10]
    @issuemetrics = Metric.where(objectmodel: 1)
    @agendametrics = Metric.where(objectmodel: 3)
    @mediationmetrics = Metric.where(objectmodel: 4)



  end

  def calcdate(y,q)
    d0= y.to_s + '-' + q.to_s + '-1'
    d2= Date.parse(d0)
    return d2
  end

  def searchbyqtrresults
    @quarter = Quarter.find(params[:quarter_id])


    d2 = self.calcdate(@quarter.qtryear, @quarter.qtrmonth)

    puts 'd2*****************************************************************'
    puts d2


    @d2 = d2
    @project = Project.find(1)


    @metric = Metric.find_by_code(params[:code])



    if params[:code] ==   "qissues"
      searchresults=@project.cumulative_issues(d2,0,0,0)
    elsif params[:code] == "qissues_new"
      searchresults = @project.quarter_issues(d2,0,0,0)
      puts searchresults
      puts 'searchresultshhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
    elsif params[:code] == "qissues_begin"
      searchresults=@project.beginissues(d2,0,0,0)

    elsif params[:code] ==     "qissues_resolved"
      searchresults=@project.quarter_resolved(d2,0,0,0)
    elsif params[:code] ==    "qmeetings"
      searchresults=@project.get_agendas(d2,0,0,0)
    elsif params[:code] ==  "qagendas"
      searchresults=@project.get_agendas(d2,0,0,0)
    elsif params[:code] ==   "aresult_resolved"
      searchresults=@project.agenda_results(d2,0,Result::RESOLVED,0,0)
    elsif params[:code] ==   "aresult_mediation"
      searchresults=@project.agenda_results(d2,0,Result::MEDIATION,0,0)
    elsif params[:code] ==   "aresult_referred"
      searchresults=@project.agenda_results(d2,0,Result::REFERRED,0,0)
    elsif params[:code] ==   "aresult_cancelled"
      searchresults=@project.agenda_results(d2,0,Result::CANCELLED,0,0)
    elsif params[:code] ==     "aresult_ongoing"
      searchresults=@project.agenda_results(d2,0,Result::ONGOING,0,0)
    elsif params[:code] ==   "qmediationstarted"
      searchresults=@project.mediation_starts(d2,0,0,0)
    elsif params[:code] == "qmediationended"
      searchresults=@project.mediation_ends(d2,0,0,0)
    elsif params[:code] ==    "mresult_resolved"
      searchresults=@project.mediation_results(d2,0,Result::RESOLVED,0,0)
    elsif params[:code] ==  "mresult_referred"
      searchresults=@project.mediation_results(d2,0,Result::REFERRED,0,0)
    elsif params[:code] ==  "mresult_cancelled"
      searchresults=@project.mediation_results(d2,0,Result::CANCELLED,0,0)
    elsif params[:code] ==   "mresult_ongoing"
      searchresults=@project.mediation_results(d2,0,Result::ONGOING,0,0)
    end


    @resultcount=searchresults.count

    if @metric.objectmodel == 1
      @issues=searchresults
      render 'issues/index'
    elsif @metric.objectmodel == 2
      @meetings = searchresults
      render 'meetings/index'
    elsif @metric.objectmodel == 3
      @myagendas = searchresults
      render 'agendas/index'
    elsif @metric.objectmodel == 4
      @mediations = searchresults
      render 'mediations/index'
    end

  end



  def searchissues
    @yloop = [2013,2014,2015,2016,2017]
    @qloop = [1,4,7,10]
    @allcategories = Category.all
    @allscopes= Scope.all
    @allstructures = Structure.order(:id)
    @alldistricts = District.all
    @allpersons = Person.all
    @allusers = User.all
    alloldids = Issue.select(:id, :old_id, :uuid).where('uuid is not NULL').uniq
    @alloldids = alloldids.order(:old_id)
    allnewids = Issue.select(:id, :structure_id).where('structure_id is not NULL').uniq
    @allnewids = allnewids.order(:id)
    @alldisputants = Disputant.select(:person_id).uniq

  end

  def searchresults

    searchterm = params[:search_term]
    searchresults = Issue.all
    searchresults = searchresults.where(status: params[:status]) if params[:status].present?

    searchresults = searchresults.where(category_id: params[:category_ids]) if params[:category_ids].present?
    searchresults = searchresults.where(structure_id: params[:structure_ids]) if params[:structure_ids].present?
    searchresults = searchresults.where('district_id in (?)', params[:district_ids]) if params[:district_ids].present?
    searchresults = searchresults.where('organization_id in (?)', params[:organization_ids]) if params[:organization_ids].present?
    searchresults = searchresults.where('name like ? or description like ? or community like  ? ', "%#{searchterm}%", "%#{searchterm}%", "%#{searchterm}%") if !params[:search_term].blank?
    searchresults = searchresults.where('id = ?', params[:new_id]) if params[:new_id].present?
    searchresults = searchresults.where('old_id = ?', params[:old_id]) if params[:old_id].present?

    if !params[:person_id].blank? or !params[:person_id].nil?
   # disputants = Disputant.select(:issue_id).where('person_id = ?', params[:person_id])
    #searchresults = searchresults.where('id in (?)', disputants)
    end

    @issues = searchresults
    render 'index'
  end






  # GET /issues/new
  def new
    @project = Project.find(1)
    @issue = Issue.new
    @issue.structure_id = params[:structure_id]






  end

  # GET /issues/1/edit
  def edit

    @project = Project.find(1)
  end

  def resolution
    @issue = Issue.find(params[:issue_id])
    render 'resolutionform'
  end







  # POST /issues
  # POST /issues.json
  def create

    @issue = Issue.new(issue_params)
    @issue.status = Status::NEW
    respond_to do |format|
      if @issue.save
        Userlog.create(user_id: current_user.id, loggable_type: 'Issue', loggable_id: @issue.id, action: 'Create')
        if params[:meeting_id]
          Issueaction.create(actiontype: 2, structure_id:  params[:issue][:structure_id], meeting_id: params[:meeting_id], issue_id: @issue.id)
          Agenda.create(meeting_id: params[:meeting_id], issue_id: @issue.id)
          meeting = Meeting.find(params[:meeting_id])
          format.html { redirect_to meeting, notice: 'Issue was successfully created.' }
          format.json { render :show, status: :created, location: meeting }
        else
          Issueaction.create(structure_id: params[:issue][:structure_id], issue_id: @issue.id, actiontype: 1, user_id: current_user.id)
          structure = Structure.find(params[:issue][:structure_id])
          format.html { redirect_to structure, notice: 'Issue was successfully created.' }
          format.json { render :show, status: :created, location: structure }

        end


      else
        if params[:structure_id]
          @project = Project.find(1)
          format.html { render :action => :new, :params => {:structure_id => params[:structure_id]}}
        else
          format.html { render :new }
        end

        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end







  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update

    respond_to do |format|
      if @issue.update(issue_params)
        Userlog.create(user_id: current_user.id, loggable_type: 'Issue', loggable_id: @issue.id, action: 'Update')

        if params[:addraiser] == '1'

          if !params[:lname].blank? and !params[:fname].blank?

            addraiser = Person.create(name_last: params[:lname], name_first: params[:fname], email: params[:email], title: params[:title])

            @issue.update_attributes(raised_by: addraiser.id)



          end
        end






        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end



    def addnote




      @issueaction=Issueaction.new()
      @issueaction.issue_id = params[:issue_id]
      @issueaction.actionbody = params[:actionbody]
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Action note was successfully updated.' }
      end
    end
  end

  def loadissues
    getissues = Appissue.where('issuename is not NULL')

    getissues.each do |i|

      if i.structurecode=='CL'
        vstrct='1'
      elsif i.structurecode=='DSC'
        vstrct='2'
      elsif i.structurecode=='DSC'
        vstrct='2'
      elsif i.structurecode=='DSC'
        vstrct='2'
      elsif i.structurecode=='DSC'
        vstrct='2'

      end



      new1=Issue.create(name: i.issuename, description: i.issuedesc, )


    end




  end




  def addcommitteemember

    @committeemember = Committeemember.new
    issue=Issue.find(params[:issue_id])
    @committeemember.issue_id = issue.id
    @committeemember.membership_id = params[:membership_id]

    respond_to do |format|
      if @committeemember.save
        format.html { redirect_to issue, notice: 'Disputant was successfully added to Issue.' }
        format.json { render :show, status: :created, location: @committeemember }
      else
        format.html { render :new }
        format.json { render json: @committeemember.errors, status: :unprocessable_entity }
      end
    end

  end


  def deletecommitteemember
    d=Committeemember.find(params[:committeemember_id]).destroy
    i = Issue.find(d.issue_id)
    respond_to do |format|
      format.html { redirect_to i, notice: 'Committe member removed from Issue.' }
      format.json { head :no_content }
    end
  end





  def adddisputant
    @disputant = Disputant.new
    issue=Issue.find(params[:issue_id])
    @disputant.issue_id = issue.id
    if params[:adddisputant]
      peep=Person.create(name_first: params[:fname], name_last: params[:lname], email: params[:email], title: params[:title], organization_id: params[:organization_id])
      @disuptant.person_id = peep.id
    else
      @disputant.person_id = params[:person_id]
    end

    respond_to do |format|
      if @disputant.save
        format.html { redirect_to issue, notice: 'Disputant was successfully added to Issue.' }
        format.json { render :show, status: :created, location: @participation }
      else
        format.html { render :new }
        format.json { render json: @disputant.errors, status: :unprocessable_entity }
      end
    end
  end


  def deletedisputant
    d=Disputant.find(params[:disputant_id]).destroy
    i = Issue.find(d.issue_id)
    respond_to do |format|
      format.html { redirect_to i, notice: 'Issue Disputant has been removed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:name, :description, :structure_id, :community, :yourname, :district_id, :location, :status, :status_note, :resolution, :resolutiontype_id,
                                    :actionplan, :other_category, :originnote, :raisedby_structure, :raised_on, :category_id, :resolution_date, :raised_by, :disputant, :scope_id, :actioncommittee, :cancelled_at, person_ids: [], meeting_ids: [] )
    end
end

