class StructuresController < ApplicationController

  before_action :set_structure, only: [:show, :edit, :update, :destroy]

  include Issuereporting

  # GET /structures
  # GET /structures.json


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
    @nsc = Structure.where('structuretype_id =?', 4)
    @csc_structures = Structure.where('structuretype =?', Structuretype::CSC)
  end

  # GET /structures/1
  # GET /structures/1.json
  def show
    self.settime



    if @structure.ismanager(current_user.id) or current_user.mldlrole == 1
         @canedit = true
    end
    @issues= Issue.where('structure_id = ?', @structure.id).order('created_at DESC')
    myissueids=@issues.pluck(:id)

    @allcats = Category.all
    @alldistricts = District.all
    @myactions = Issueaction.where(structure_id: @structure.id).order('created_at DESC').limit(20)
    @mediations = Mediation.where(issue_id: myissueids)
    @mypeople= Membership.where('structure_id = ?', @structure.id)
    @mymanagers = Manager.where('structure_id = ?', @structure.id)

    @meetings = Meeting.where(structure_id: @structure.id)
    @openmeetings = @meetings.where(meeting_held: true)

    @parent = Structure.find(@structure.parent_id) if @structure.parent_id
    #@availablemanagers = Userrole.where('role_id = ?', 2)
    @availablemanagers = User.where('mldlrole =? ', 2)
    #@availablemanagers = []
    #users=Userrole.where('role_id = ?', 2)
    #users.each do |u|
    #  @availablemanagers.append(User.find(u.user_id))
    #end
    @issue = Issue.new
    @meeting = Meeting.new
    @available_people = Person.all
    @person = Person.new
    @membership = Membership.new
    @manager = Manager.new






    catsids = CategoriesStructure.where('category_id > 0 and structure_id = ?', @structure.id).order('vcount desc')
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



    distids = DistrictsStructure.where('district_id > 0 and structure_id = ?', @structure.id).order('vcount desc')
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











  end

  # GET /structures/new
  def new

    @structure = Structure.new

  end

  # GET /structures/1/edit
  def edit

  end




  # POST /structures
  # POST /structures.json
  def create
    @structure = Structure.new(structure_params)

    respond_to do |format|
      if @structure.save
        format.html { redirect_to @structure, notice: 'Structure was successfully created.' }
        format.json { render :show, status: :created, location: @structure }
      else
        format.html { render :new }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /structures/1
  # PATCH/PUT /structures/1.json
  def update

    respond_to do |format|
      if @structure.update(structure_params)
        format.html { redirect_to @structure, notice: 'Structure was successfully updated.' }
        format.json { render :show, status: :ok, location: @structure }
      else
        format.html { render :edit }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /structures/1
  # DELETE /structures/1.json
  def destroy
    @structure.destroy
    respond_to do |format|
      format.html { redirect_to structures_url, notice: 'Structure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def addmembership

    @membership = Membership.new
    structure=Structure.find(params[:structure_id])
    @membership.structure_id = structure.id
    if params[:addpeep]
      peep=Person.create(name_first: params[:fname], name_last: params[:lname], email: params[:email], title: params[:title], organization_id: params[:organization_id])
      @membership.person_id = peep.id
    else
      @membership.person_id = params[:person_id]
    end

    respond_to do |format|
      if @membership.save
        format.html { redirect_to structure, notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end

  end


  def addmanager

    @manager = Manager.new
    structure=Structure.find(params[:structure_id])
    @manager.structure_id = structure.id
    @manager.user_id = params[:user_id]

    respond_to do |format|
      if @manager.save
        format.html { redirect_to structure, notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end

  end



  def managersmap
@csc_structures = Structure.where(structuretype: 3)
render 'managersmap'

  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure
      @structure = Structure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structure_params
      params.require(:structure).permit(:name, :structuretype, :district_id, :county_id, :parent_id, :default_location, memberships:[:person_id, :structure_id])
    end
end
