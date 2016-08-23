class MediatorsController < ApplicationController
  before_action :set_mediator, only: [:show, :edit, :update, :destroy]

  # GET /mediators
  # GET /mediators.json
  def index
    @mediators = Mediator.all
  end

  # GET /mediators/1
  # GET /mediators/1.json
  def show


  end

  # GET /mediators/new
  def new
    @mediator = Mediator.new
  end

  # GET /mediators/1/edit
  def edit
  end

  # POST /mediators
  # POST /mediators.json
  def create
    @mediator = Mediator.new(mediator_params)


    mediation=Mediation.find(params[:mediation_id])
    @mediator.mediation_id = params[:mediation_id]
    if params[:addpeep]
      peep=Person.create(name_first: params[:fname], name_last: params[:lname], email: params[:email])
      @mediator.person_id = peep.id
    end










    respond_to do |format|
      if @mediator.save
        format.html { redirect_to mediation, notice: 'Mediator was successfully created.' }
        format.json { render :show, status: :created, location: @mediator }
      else
        format.html { render :new }
        format.json { render json: @mediator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mediators/1
  # PATCH/PUT /mediators/1.json
  def update
    respond_to do |format|
      if @mediator.update(mediator_params)
        format.html { redirect_to @mediator, notice: 'Mediator was successfully updated.' }
        format.json { render :show, status: :ok, location: @mediator }
      else
        format.html { render :edit }
        format.json { render json: @mediator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mediators/1
  # DELETE /mediators/1.json
  def destroy
    @mediator.destroy
    respond_to do |format|
      format.html { redirect_to mediators_url, notice: 'Mediator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mediator
      @mediator = Mediator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mediator_params
      params.require(:mediator).permit(:person_id, :mediation_id)
    end
end
