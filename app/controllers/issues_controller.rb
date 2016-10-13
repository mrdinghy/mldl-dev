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
    @openagendas = Agenda.where('issue_id = ? and addressed is null', @issue.id)
    @openmediations = Mediation.where('issue_id = ? and mediate_end is null', @issue.id)

    @mydisputants = Disputant.where('issue_id=?', @issue.id)

    @numberactions = @myactions.count
    @numbermediations = @mymediations.count
    @numberagendas = @myagendas.count
    @numberdisputants = @mydisputants.count




    @disputant = Disputant.new
    @available_people = Person.all


    @raisedby = Person.find(@issue.raised_by) if @issue.raised_by
    @issueaction = Issueaction.new
    @agenda = Agenda.new
    @mediation = Mediation.new
    @issuedocs = SiteDocument.where('documentable_type = ? and documentable_id = ?', 'issue', @issue.id)
    @new_site_document = SiteDocument.new
    parent_id = @issue.structure.parent_id if @issue.structure.parent_id
    @parent = Structure.find(parent_id) if parent_id
    @gapps = Appissue.where('issueid = ?', @issue.old_id)



    respond_to do |format|
      format.html
      format.pdf do
        pdf = IssuePdf.new(@issue)
        send_data pdf.render, filename: "order_#{@issue.issuecode}.pdf",
                  type: "application/pdf",
                  disposition: "inline"
      end
    end






  end






  def searchissues

    @allcategories = Category.all
    @allscopes= Scope.all
    @allstructures = Structure.order(:id)
    @alldistricts = District.all
    @allpersons = Person.all
    @allusers = User.all
    @alloldids = Issue.select(:id, :uuid).where('uuid is not NULL').uniq
    @allnewids = Issue.select(:id, :structure_id).where('structure_id is not NULL').uniq
    @alldisputants = Disputant.select(:person_id).uniq

  end

  def searchresults

    searchterm = params[:search_term]
    searchresults = Issue.all
    searchresults = Issue.where('category_id in (?)', params[:category_ids]) if !params[:category_ids].blank?
    searchresults = Issue.where('structure_id in (?)', params[:structure_ids]) if !params[:structure_ids].blank?
    searchresults = Issue.where('district_id in (?)', params[:district_ids]) if !params[:district_ids].blank?
    searchresults = Issue.where('organization_id in (?)', params[:organization_ids]) if !params[:organization_ids].blank?
    searchresults = Issue.where('name like ? or description like ? or community like  ? ', "%#{searchterm}%", "%#{searchterm}%", "%#{searchterm}%") if !params[:search_term].blank?
    searchresults = Issue.where('id =?', params[:new_id]) if !params[:new_id].blank?
    searchresults = Issue.where('id in (?)', params[:old_id]) if !params[:old_id].blank?


    disputants = Disputant.select(:issue_id).where('person_id = ?', params[:person_id]) if !params[:person_id].blank?
    searchresults = Issue.where('id in (?)', disputants) if !params[:person_id].blank?

    @issues = searchresults
    render 'index'
  end







  # GET /issues/new
  def new
    @issue = Issue.new

    if params[:structure_id]
      @issue.update_attributes(:structure_id => params[:structure_id])
    end
  end

  # GET /issues/1/edit
  def edit
  end

  def resolution
    @issue = Issue.find(params[:issue_id])
    render 'resolutionform'
  end







  # POST /issues
  # POST /issues.json
  def create
    #@issue = Issue.new(issue_params)
    #@issue.update_attributes(status:Status::NEW)
    #if params[:issue][:structure_id].present?
      #@issue.update_attributes(:structure_id => params[:issue][:structure_id])

    #end

    respond_to do |format|
      if @issue.save
        if params[:meeting_id]
          Issueaction.create(actiontype: 2, structure_id:  params[:issue][:structure_id], meeting_id: params[:meeting_id], issue_id: @issue.id)
          Agenda.create(meeting_id: params[:meeting_id], issue_id: @issue.id)
          meeting = Meeting.find(params[:meeting_id])
           format.html { redirect_to meeting, notice: 'Issue was successfully created.' }
           format.json { render :show, status: :created, location: meeting }
        elsif params[:structure_id]
          Issueaction.create(structure_id: structure.id, issue_id: @issue.id, actiontype: 1, user_id: current_user.id)
          structure = Structure.find(params[:structure_id])
          format.html { redirect_to structure, notice: 'Issue was successfully created.' }
          format.json { render :show, status: :created, location: structure }
        else

          format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
          format.json { render :show, status: :created, location: @issue }
        end


      else
        if params[:structure_id]
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

    puts '=================dfasfdfsdfsd====================adfasddsff================='

    respond_to do |format|
      if @issue.update(issue_params)
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



  def seeder
    struct=7
    Issue.where('id > 108').destroy_all
    Meeting.where('id > 28').destroy_all
    Issueaction.where('id > 0').destroy_all

    self.seeder2(7)
    self.seeder2(8)
    self.seeder2(9)
    self.seeder2(10)
    self.seeder2(11)
    self.seeder2(12)
    self.seeder2(13)

render 'index'

  end



  def seeder2(struct)


    self.seedmeeting(1,struct)
    self.seedmeeting(2,struct)
    self.seedmeeting(3,struct)
    self.seedmeeting(4,struct)
    self.seedmeeting(5,struct)
    self.seedmeeting(6,struct)
    self.seedmeeting(7,struct)
    self.seedmeeting(8,struct)

    self.seedagendas(1,struct)







  end

def seedagendas(m,struct)

  meets = Meeting.where('structure_id = ?', struct)
  meets.each do |sm|
    agendadate=sm.real_start - 3.days
    decdate = sm.real_start
    issues2 = Issue.where('extract(month from created_at) = ? and structure_id = ?', m,struct)
    issues2.each do |i2|
      agenda=Issueaction.create(issue_id: i2.id, actiontype: 2, structure_id: struct, meeting_id: sm, actionbody: 'added to meeting', user_id: rand(2..5))

      agenda.created_at = agendadate
      agenda.save!


      outcome = [34,35,36,37,38].sample

      if outcome = 35
      agenda=Issueaction.create(issue_id: i2.id, actiontype: 35, structure_id: struct, meeting_id: sm, actionbody: 'resolved at meeting', user_id: rand(2..5))

      i2.resolution_date = decdate
      i2.save

      agenda.created_at = decdate
      agenda.save!
      end


      if outcome = 34
        agenda=Issueaction.create(issue_id: i2.id, actiontype: 34, structure_id: struct, meeting_id: sm, actionbody: 'unresolved at meeting', user_id: rand(2..5))

        agenda.created_at = sm.real_start
        agenda.save!
      end

      if outcome = 38
        agenda=Issueaction.create(issue_id: i2.id, actiontype: 38, structure_id: struct, meeting_id: sm, actionbody: 'unresolved at meeting', user_id: rand(2..5))

        agenda.created_at = sm.real_start
        agenda.save!
      end







    end
  end
end


  def seedmeeting(m,structure_id)
    meeting1 = Meeting.create(name: 'weekly meeting', location: 'Meeting House', real_start: DateTime.new(2016,m,rand(1..27),9,0,0), structure_id: structure_id)

    Meeting.update(meeting1, real_end: meeting1.real_start + 1.hours)
    array = [1, 2, 3, 4, 5, 6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    array.each { |x|
      self.seedissue(m,structure_id)
    }



  end



  def seedissue(m,structure_id)
  newissue=Issue.create(
      name: 'Test Issue lice presence in Wee-Gbeyi District',
      description: 'Mob violence in Wee-Gbeyi district over the past few years, Wee-Gbeyi DSC members reported on limited security personnel presence in the district With the history',
      structure_id: structure_id,
      district_id: rand(12..17),
      scope_id: rand(1..5),
      actionplan: 'Referred to CSC for redress in two months',
      disputant: 'All citizens of Wee-Gbeyi',
      community: 'Test community',
      category_id: rand(1..10),
      old_id: '2015-11-CF-XX-00168',
      actioncommittee: 'DSC leadership')

  newissue.created_at = DateTime.new(2016,m,22,9,0,0)
    newissue.save!

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
        format.html { redirect_to issue, notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @participation }
      else
        format.html { render :new }
        format.json { render json: @disputant.errors, status: :unprocessable_entity }
      end
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
                                    :actionplan, :category_id, :resolution_date, :raised_by, :disputant, :scope_id, :actioncommittee, :cancelled_at, person_ids: [], meeting_ids: [] )
    end
end

