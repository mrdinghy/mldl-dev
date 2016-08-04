class AppissuesController < ApplicationController
  before_action :set_appissue, only: [:show, :edit, :update, :destroy]

  # GET /appissues
  # GET /appissues.json
  def index
    @appissues = Appissue.all

    @communities=Appissue.select(:district, :community).where('structurecode = ?', 'CF').uniq

    @communities.each do |c|
      puts c.community
      #district = District.find_by_name(c.district)
      #Community.create(name: c.community, district_id: district.id )
    end

    @meetings = Appissue.select(:originalmeet, :meetingname, :structurecode, :county, :district, :community).order(:meetingname).uniq

    @meetings.each do |m|

      county = County.find_by_name(m.county)
      district = District.find_by_name(m.district)
      struct = Structure.find_by_name(m.structurecode )
      community = Community.find_by_name(m.community)

      Meeting.create(name: m.meetingname, meeting_on: m.originalmeet, structure_id: struct.id, county_id: county.id, district_id: district.id, community_id: community.id  )




    end





  end


  def uploadcsv
    Appissue.import(params[:file])
    redirect_to root_url, notice: "Google Apps Issues imported."


  end

  def makemeetings
    @meetings = Appissue.select(:originalmeet, :meetingname, :structurecode, :county, :district).order(:meetingname).uniq
    @countydist = Appissue.select(:county, :district).order(:county, :district).uniq

  end





  # GET /appissues/1
  # GET /appissues/1.json
  def show
  end

  # GET /appissues/new
  def new
    @appissue = Appissue.new
  end

  # GET /appissues/1/edit
  def edit
  end

  # POST /appissues
  # POST /appissues.json
  def create
    @appissue = Appissue.new(appissue_params)

    respond_to do |format|
      if @appissue.save
        format.html { redirect_to @appissue, notice: 'Appissue was successfully created.' }
        format.json { render :show, status: :created, location: @appissue }
      else
        format.html { render :new }
        format.json { render json: @appissue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appissues/1
  # PATCH/PUT /appissues/1.json
  def update
    respond_to do |format|
      if @appissue.update(appissue_params)
        format.html { redirect_to @appissue, notice: 'Appissue was successfully updated.' }
        format.json { render :show, status: :ok, location: @appissue }
      else
        format.html { render :edit }
        format.json { render json: @appissue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appissues/1
  # DELETE /appissues/1.json
  def destroy
    @appissue.destroy
    respond_to do |format|
      format.html { redirect_to appissues_url, notice: 'Appissue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appissue
      @appissue = Appissue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appissue_params
      params.require(:appissue).permit(:uuid, :yourname, :originalmeet, :issueid, :meetingname, :structurecode, :county, :district, :status, :issuedistrict, :community, :category, :raisedby, :disputant, :duration, :actioncommittee, :actiondescription, :actionnote, :resolved, :resolutiondate, :docslink, :updatetype, :resolutiontype, :updated_on, :updatedesc, :mediationdate, :mediationoutcome, :issuedesc, :issuename, :issuenote, :statusnote)
    end
end
