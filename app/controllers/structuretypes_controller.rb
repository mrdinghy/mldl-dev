class StructuretypesController < ApplicationController
  before_action :set_structuretype, only: [:show, :edit, :update, :destroy]

  # GET /structuretypes
  # GET /structuretypes.json
  def index
    @structuretypes = Structuretype.all
  end

  # GET /structuretypes/1
  # GET /structuretypes/1.json
  def show
  end

  # GET /structuretypes/new
  def new
    @structuretype = Structuretype.new
  end

  # GET /structuretypes/1/edit
  def edit
  end

  # POST /structuretypes
  # POST /structuretypes.json
  def create
    @structuretype = Structuretype.new(structuretype_params)

    respond_to do |format|
      if @structuretype.save
        format.html { redirect_to @structuretype, notice: 'Structuretype was successfully created.' }
        format.json { render :show, status: :created, location: @structuretype }
      else
        format.html { render :new }
        format.json { render json: @structuretype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /structuretypes/1
  # PATCH/PUT /structuretypes/1.json
  def update
    respond_to do |format|
      if @structuretype.update(structuretype_params)
        format.html { redirect_to @structuretype, notice: 'Structuretype was successfully updated.' }
        format.json { render :show, status: :ok, location: @structuretype }
      else
        format.html { render :edit }
        format.json { render json: @structuretype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /structuretypes/1
  # DELETE /structuretypes/1.json
  def destroy
    @structuretype.destroy
    respond_to do |format|
      format.html { redirect_to structuretypes_url, notice: 'Structuretype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structuretype
      @structuretype = Structuretype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structuretype_params
      params.require(:structuretype).permit(:name)
    end
end
