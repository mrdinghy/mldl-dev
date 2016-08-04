class ActiontypesController < ApplicationController
  before_action :set_actiontype, only: [:show, :edit, :update, :destroy]

  # GET /actiontypes
  # GET /actiontypes.json
  def index
    @actiontypes = Actiontype.all
  end

  # GET /actiontypes/1
  # GET /actiontypes/1.json
  def show
  end

  # GET /actiontypes/new
  def new
    @actiontype = Actiontype.new
  end

  # GET /actiontypes/1/edit
  def edit
  end

  # POST /actiontypes
  # POST /actiontypes.json
  def create
    @actiontype = Actiontype.new(actiontype_params)

    respond_to do |format|
      if @actiontype.save
        format.html { redirect_to @actiontype, notice: 'Actiontype was successfully created.' }
        format.json { render :show, status: :created, location: @actiontype }
      else
        format.html { render :new }
        format.json { render json: @actiontype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actiontypes/1
  # PATCH/PUT /actiontypes/1.json
  def update
    respond_to do |format|
      if @actiontype.update(actiontype_params)
        format.html { redirect_to @actiontype, notice: 'Actiontype was successfully updated.' }
        format.json { render :show, status: :ok, location: @actiontype }
      else
        format.html { render :edit }
        format.json { render json: @actiontype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actiontypes/1
  # DELETE /actiontypes/1.json
  def destroy
    @actiontype.destroy
    respond_to do |format|
      format.html { redirect_to actiontypes_url, notice: 'Actiontype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actiontype
      @actiontype = Actiontype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actiontype_params
      params.require(:actiontype).permit(:name)
    end
end
