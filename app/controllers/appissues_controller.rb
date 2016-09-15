class AppissuesController < ApplicationController
  before_action :set_appissue, only: [:show, :edit, :update, :destroy]

  # GET /appissues
  # GET /appissues.json
  def index
    @appissues = Appissue.all

    meetings = Appissue.select(:meetingname, :structure, :structurecounty, :structuredistrict, :meetingcode, :originalmeetingdate).order(:meetingcode).uniq
    meetings.each do |meet|
    s = self.retstruct(meet.structurecounty, meet.structuredistrict, meet.structure)
    m=Meeting.create(name: meet.meetingname, real_start: meet.originalmeetingdate, old_id: meet.meetingcode, structure_id: s)
     end






  end


  def retstruct(county, district, structure)
    if structure == 'NSC'
      s=1
    else
        if county == 'Nimba'
          if structure == 'CSC'
          s=2
          elsif district
            if district.include? 'Gbehlay'
              if structure == 'DSC'
              s=15
              elsif structure == 'CF'
              s=16
              else
              s=0
              end
            elsif district.include? 'Buu'
              if structure == 'DSC'
              s=17
              elsif structure == 'CF'
              s=18
              else
              s=0
              end
            elsif district.include? 'Wee'
              if structure == 'DSC'
              s=19
              elsif structure == 'CF'
              s=20
              else
              s=0
              end
            elsif district.include? 'Kpai'
              if structure == 'DSC'
              s=21
              elsif structure == 'CF'
              s=22
              else
              s=0
              end
            elsif district.include? 'Garr-B'
              if structure == 'DSC'
              s=23
              elsif structure == 'CF'
              s=24
              else
              s=0
              end
            elsif district.include? 'Yarm'
              if structure == 'DSC'
              s=25
              elsif structure == 'CF'
              s=26
              else
              s=0
              end
            else
              s=0
           end
          end




        elsif county == 'Bong'
          if structure == 'CSC'
            s=2
          elsif district
            if district.include? 'Kpaai'
              if structure == 'DSC'
              s=3
              elsif structure == 'CF'
              s=4
              else
              s=0
              end
            elsif district.include? 'Suak'
              if structure == 'DSC'
              s=5
              elsif structure == 'CF'
              s=6
              else
              s=0
              end
          end
          else
            s=0

          end



        elsif county == 'Lofa'
          if structure == 'CSC'
            s=7
          elsif district
            if district.include? 'Foya'
              if structure == 'DSC'
              s=8
              elsif structure == 'CF'
              s=9
              else
              s=0
              end
            elsif district.include? 'Voin'
              if structure == 'DSC'
              s=10
              elsif structure == 'CF'
              s=11
              else
              s=0
              end
            elsif district.include? 'Zor'
              if structure == 'DSC'
              s=12
              elsif structure == 'CF'
              s=13
              else
              s=0
              end
            end
          else
            s=0
          end

        elsif county == 'Grand Gedeh'
          if structure == 'CSC'
           s=27
          elsif district
            if district.include? 'Bhai'
              if structure == 'DSC'
              s=28
              else
              s=0
              end
            elsif district.include? 'Gbao'
              if structure == 'DSC'
              s=28
              else
              s=0
              end
            elsif district.include? 'Kono'
              if structure == 'DSC'
              s=28
              else
              s=0
              end
            end
          else
            s=0

          end
        end
    end

    return s
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
