class MediationsController < ApplicationController
  before_action :set_mediation, only: [:show, :edit, :update, :destroy]

  # GET /mediations
  # GET /mediations.json
  def index
    @mediations = Mediation.all
  end

  # GET /mediations/1
  # GET /mediations/1.json
  def show
    @issue=Issue.find(@mediation.issue_id)
    if @issue.structure.ismanager(current_user.id) or current_user.mldlrole == 1
      @canedit=true
    end
    #@issue=Issue.find(@mediation.issue_id)
    @mediators = Mediator.where('mediation_id = ?', @mediation.id)
    @mediator = Mediator.new
    @new_site_document = SiteDocument.new
    @issueaction = Issueaction.new
    @available_people = Person.all
    @mediationdocs = SiteDocument.where('documentable_type = ? and documentable_id = ?', 'mediation', @mediation.id)
  end

  # GET /mediations/new
  def new
    @mediation = Mediation.new
    if params[:issue_id]

      @issue = Issue.find(params[:issue_id])

    end
  end

  # GET /mediations/1/edit
  def edit
  end

  # POST /mediations
  # POST /mediations.json
  def create

    @mediation = Mediation.new(mediation_params)

    d1 = Date.parse(params[:mediate_start])


    @mediation.update_attributes!(:mediation_start => d1)

   @mediation.save!

    issueaction= Issueaction.new
    issue = Issue.find(@mediation.issue_id)

    Issueaction.create(mediation_id: @mediation.id, issue_id: params[:issue_id], user_id: current_user.id, actiontype: Actiontype::MEDIATION, structure_id: issue.structure_id)
    respond_to do |format|
      if @mediation.save
        format.html { redirect_to issue, notice: 'Mediation was successfully created.' }
        format.json { render :show, status: :created, location: @mediation }
      else
        format.html { render :new }
        format.json { render json: @mediation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mediations/1
  # PATCH/PUT /mediations/1.json
  def update
   # if !params[:mediate_start].blank?
      #d1 = Date.parse(params[:mediate_start])
      #@mediation.update_attributes!(:mediation_start => d1)
    #end
    #if !params[:mediate_end].blank?
    #  d2 = Date.parse(params[:mediate_end])
    #  @mediation.update_attributes!(:mediation_end => d2)
    #end
    #Issueaction.create(mediation_id: @mediation.id, issue_id: params[[:issue_id], user_id: current_user.id, actiontype: params[:actiontype], structure_id: issue.structure_id)

    #@mediation.update_attributes!(:mediation_end => d2)
    respond_to do |format|
      if @mediation.update(mediation_params)
        format.html { redirect_to @mediation, notice: 'Mediation was successfully updated.' }
        format.json { render :show, status: :ok, location: @mediation }
      else
        format.html { render :edit }
        format.json { render json: @mediation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mediations/1
  # DELETE /mediations/1.json
  def destroy
    @mediation.destroy
    respond_to do |format|
      format.html { redirect_to mediations_url, notice: 'Mediation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  def addmediator
    @mediator = Mediator.new
    mediation=Mediation.find(params[:mediation_id])
    @mediator.mediation_id = mediation.id
    if params[:addpeep]
      peep=Person.create(name_first: params[:fname], name_last: params[:lname], email: params[:email], title: params[:title], organization_id: params[:organization_id])
      @mediator.person_id = peep.id
    else
      @mediator.person_id = params[:person_id]
    end

    respond_to do |format|
      if @mediator.save
        format.html { redirect_to mediation, notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @mediator }
      else
        format.html { render :new }
        format.json { render json: @mediator.errors, status: :unprocessable_entity }
      end
    end

  end



















  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mediation
      @mediation = Mediation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mediation_params
      params.require(:mediation).permit(:name, :issue_id, :mediate_start, :mediate_end, :mediation_held, :mediation_notes)
    end
end
