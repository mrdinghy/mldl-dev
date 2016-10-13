class StructuresController < ApplicationController

  before_action :set_structure, only: [:show, :edit, :update, :destroy]

  include Issuereporting

  # GET /structures
  # GET /structures.json
  def index
    @nsc = Structure.where('structuretype_id =?', 4)
    @csc_structures = Structure.where('structuretype =?', Structuretype::CSC)
  end

  # GET /structures/1
  # GET /structures/1.json
  def show
    @yloop = [2013,2014,2015,2016]
    @qloop = [1,4,7,10]

    if @structure.ismanager(current_user.id) or current_user.mldlrole == 1
         @canedit = true
    end
    @issues= Issue.where('structure_id = ?', @structure.id).order('created_at DESC')

    cats= Category.all
    flotter = '['
    cats.each do |c|

       slice1 = '{ "label": "' + c.name + '", "color": "#4acab4","data": 30}'

        if c == Category.last
          slice2 = slice1
        else
          slice2 = slice1 + ','
        end
      flotter = flotter + slice2

    end

@piefinal = flotter + ']'


    @allcats = Category.all
    @alldistricts = District.all

    @mediations = Mediation.all
    @mypeople= Membership.where('structure_id = ?', @structure.id)
    @mymanagers = Manager.where('structure_id = ?', @structure.id)

    @meetings = Meeting.where(structure_id: @structure.id)
    #@openmeetings = @mymeetings.where(meeting_held: true)

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
