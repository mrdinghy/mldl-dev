class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json



  def settime
    @project = Project.find(1)

    @yloop = [2013,2014,2015,2016,2017]
    @qloop = [1,4,7,10]

    @currentyear = Date.today.year
    @currentqtr = Date.today.beginning_of_quarter.month
    @currentbegin = Date.today.beginning_of_quarter
    @currentend = Date.today.end_of_quarter

    if params[:qtr].nil?
      @thisyear = @currentyear
      @thisqtr = @currentqtr


      #@thisyear = 2015
      #@thisqtr = 10
    else
      @thisyear = params[:year]
      @thisqtr = params[:qtr]
    end

    d0= @thisyear.to_s + '-' + @thisqtr.to_s + '-01 '
    @d2 = Time.parse(d0)


    if @thisqtr == 1
      @qtrname = @thisyear.to_s + '1st Qtr'
    elsif @thisqtr == 4
      @qtrname = @thisyear.to_s + '2nd Qtr'
    elsif @thisqtr == 7
      @qtrname =@thisyear.to_s + '3rd Qtr'
    elsif @thisqtr == 10
      @qtrname = @thisyear.to_s + '4th Qtr'
    else
      @qtrname = 'n/a'
    end


  end








  def index
    self.settime
    @projects = Project.all
  end


  def monthlyreport
     @cscs= County.where('id in (2,7,11,12)')

     render 'projects/monthlyreport'

  end
  def monthlyresults
     @county = County.find(params[:county_id])

    @project = Project.find(1)
     @countystructures = Structure.where(county_id: params[:county_id])
     @sids = @countystructures.pluck(:id)
     @monthstart = Date.new(params[:reportyear].to_i,params[:reportmonth].to_i,1)
     @monthend = @monthstart.end_of_month
    render 'projects/monthlyresults'

  end


  def countyadminreport
    @cscs= County.where('id in (2,7,11,12)')

    render 'projects/countyadminreport'

  end
  def countyadminresults

    @countystructures = Structure.where(county_id: params[:county_id])
    sids = @countystructures.pluck(:id)
    @cissues=Issue.where(structure_id: sids)
    cissueids = @cissues.pluck(:id)
    @cmediations=Mediation.where(issue_id: cissueids)
    @cmeetings = Meeting.where(structure_id: sids)



    @project = Project.find(1)


    @openissues = @cissues.where('status = ? or status = ?', Status::ONGOING, Status::NEW)
    openissueids = @openissues.pluck(:id)
    @closedissues = @cissues.where('status = ? or status = ?', Status::RESOLVED, Status::CANCELLED)
    @mediationissues = @cissues.where(status: Status::MEDIATION)

    closedissueids = @closedissues.pluck(:id)
    mediationissueids = @mediationissues.pluck(:id)

    closedmeetings = @cmeetings.where(meeting_held: :true)
    closedmeetingids = closedmeetings.pluck(:id)
    @unaddressed = Agenda.where(meeting_id: closedmeetingids, result: nil)
    @openmeetings = @cmeetings.where(meeting_held: :false)
    openmeetingids = @openmeetings.pluck(:id)

    closedmediations = @cmediations.where(mediation_held: :true)
    @closedmediation_noenddate = closedmediations.where(mediate_end: nil)
    @enddate_notclosed = closedmediations.where.not(mediate_end: nil).where(mediation_held: nil)
    @openmediations = @cmediations.where(mediation_held: nil)

    puts @openmediations.count


    openmeidationids = @openmediations.pluck(:id)





    @openwithresolvedissues = @openmediations.where(issue_id: closedissueids)
    #@openwithnomedationstatus = Issue.where()

    inmediationissues = @cissues.where(status: Status::MEDIATION)
    inmediationissueids = inmediationissues.pluck(:id)

    @falseissuemediationstatus = @openmediations.where.not(issue_id: mediationissueids)
    @resolved = Issue.where(status: Status::RESOLVED)
    @emptyresolved = @resolved.where(resolution_date: nil)
    old1 = 6.months.ago
    old2 = old1.to_date
    @openandold = @openissues.where('raised_on < ?', old2)
puts @openandold.count
    puts '*****************cutoff************************************'




    render 'projects/countyadminresults'

  end






















  def dashboard




    self.settime

    @summaryissues = Issue.all.count
    @summarymeetings = Meeting.all.count
    @summarymediations = Mediation.all.count
    @summaryresolved = Issue.where('resolution_date is not NULL').count
    @summaryopenissues =  Issue.where('status = ? or status = ?', Status::ONGOING, Status::NEW).count
    @summaryopenmediations = Mediation.where(mediation_held: nil).count




    self.categorydata




    catsids = PieCategory.where('category_id > 0').order('vcount desc')
catcolor = 1
    cattotals = ''
    catsids.each do |c|

      slice = CategoryColor.find(catcolor)
      c1 = '{ "label": "' + c.category.name + '", "value": ' + c.vcount.to_s + ', "color": "' + slice.name  + '"}'
        if c != catsids.last
          c1 = c1 + ','
        end

          catcolor = catcolor + 1


        cattotals = cattotals + c1

    end
    @catdata =   cattotals




    distids = PieDistrict.where('district_id > 0').order('vcount desc')
    distcolor = 1
    disttotals = ''
    distids.each do |d|
      slice = CategoryColor.find(distcolor)
      d1 = '{ "label": "' + d.district.name + '", "value": ' + d.vcount.to_s + ', "color": "' + slice.name  + '"}'
      if d != distids.last
        d1 = d1 + ','
      end
      if distcolor == 10
        distcolor = 2
      else
        distcolor = distcolor + 1
      end




      disttotals = disttotals + d1

    end
    @distdata =   disttotals







    structids = ProjectStructure.where('structure_id > 0').order('vcount desc')
    structcolor = 1
    structtotals = ''
    structids.each do |s|
      slice = CategoryColor.find(structcolor)
      s1 = '{ "label": "' + s.structure.name + '", "value": ' + s.vcount.to_s + ', "color": "' + slice.name  + '"}'
      if s != structids.last
        s1 = s1 + ','
      end
      if structcolor == 10
        structcolor = 2
      else
        structcolor = structcolor + 1
      end




      structtotals = structtotals + s1

    end
    @structdata =   structtotals
























    render 'overview_dashboard'
  end


  def structurereport
    self.settime
    @structures = Structure.all

    render 'overview_structures'


  end
 def quarterlyreport
   self.settime
   render 'overview_quarterly'
 end

  def lofa
    self.settime
    @structureid = [7]
    @lofadsccf = [12,13,10,11,8,9]
    @lofaall =  [7,12,13,10,11,8,9]
    @categories = Category.all
    render 'overview_lofa'
  end

  def grandgedeh
    self.settime
    @structureid = [27]
    @lofadsccf = [28,29,30,31,32,33]
    @lofaall =   [27,28,29,30,31,32,33]
    @categories = Category.all
    render 'overview_grandgedeh'
  end

  def nimba
    self.settime
    @structureid = [14]
    @lofadsccf = [15,16,17,18,19,20,21,22,23,24,25,26]
    @lofaall =  [14,15,16,17,18,19,20,21,22,23,24,25,26]
    @categories = Category.all
    render 'overview_nimba'
  end

  def bong
    self.settime
    @structureid = [2]
    @lofadsccf = [3,4,5,6]
    @lofaall =  [2,3,4,5,6]
    @categories = Category.all
    render 'overview_bong'
  end


  def show
    self.settime




  end




  def categorydata





  end





  def districtdata(s1)

  districtids = District.order(:id)

    distlabels = ''
    disttotals = ''
    districtids.each do |d|

      calceach = Issue.where('district_id = ?', d.id).count


      if calceach != 0
        if d == districtids.count
          d1 = calceach.to_s
          d2 = '"' + d.name + '"'
        else
          d1 = calceach.to_s + ','
          d2 = '"' + d.name + '",'
        end

      disttotals = disttotals + d1
      distlabels = distlabels + d2
      end
    end
    @distdata = disttotals
    @distlabels = distlabels







  end

  def details_to_json
    {
        :id                    => self.id,
        :credit_period_type    => self.credit_period_type,
        :credit_payment_period => self.credit_payment_period,

    }.to_json
  end




def othercategories
  @theothers = Issue.select(:other_category).uniq






end

  def qtrreport
    @project = Project.find(1)








    render 'showquarter'




  end




def q1234(q,y)
  if q == 1
    x1='Q1'
  elsif q == 4
    x= 'Q2'
  elsif q == 7
    x= 'Q3'
  elsif q == 10
    x= 'Q4'
  else
    x='na'
  end
  return y + '_' + x

end



  def agendaresults


    jstring = '['

    @yloop.each do |y|
      @qloop.each do |q|

        d2 = self.calcdate(q,y)
        r1 = ('{ x: ' + self.q1234(q,y) + ', y: ' + @project.agenda_results(d2,0,Result::RESOLVED,0,0)) + '}'
        m1 = ('{ x: ' + self.q1234(q,y) + ', y: ' + @project.agenda_results(d2,0,Result::MEDIATION,0,0)) + '}'
        c1 = ('{ x: ' + self.q1234(q,y) + ', y: ' + @project.agenda_results(d2,0,Result::CANCELLED,0,0)) + '}'
        o1 = ('{ x: ' + self.q1234(q,y) + ', y: ' + @project.agenda_results(d2,0,Result::ONGOING,0,0)) + '}'
        f1 = ('{ x: ' + self.q1234(q,y) + ', y: ' + @project.agenda_results(d2,0,Result::REFERRED,0,0)) + '}'

      end



    end






  end



  def resultaudit
    @projects = Project.find(1)
    @allissues = Issue.all
  end




  def clearsteve
      d=Issueaction.where(:user_id => 2).delete_all
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Committe member removed from Issue.' }
        format.json { head :no_content }
      end
  end






  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.fetch(:project, {})
    end
end
