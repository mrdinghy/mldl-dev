class InfopopupsController < ApplicationController
  before_action :set_infopopup, only: [:show, :edit, :update, :destroy]

  # GET /infopopups
  # GET /infopopups.json
  def index
    @infopopups = Infopopup.all
  end

  # GET /infopopups/1
  # GET /infopopups/1.json
  def show
  end

  # GET /infopopups/new
  def new
    @infopopup = Infopopup.new
  end

  # GET /infopopups/1/edit
  def edit
  end

  # POST /infopopups
  # POST /infopopups.json
  def create
    @infopopup = Infopopup.new(infopopup_params)

    respond_to do |format|
      if @infopopup.save
        format.html { redirect_to @infopopup, notice: 'Infopopup was successfully created.' }
        format.json { render :show, status: :created, location: @infopopup }
      else
        format.html { render :new }
        format.json { render json: @infopopup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /infopopups/1
  # PATCH/PUT /infopopups/1.json
  def update
    respond_to do |format|
      if @infopopup.update(infopopup_params)
        format.html { redirect_to @infopopup, notice: 'Infopopup was successfully updated.' }
        format.json { render :show, status: :ok, location: @infopopup }
      else
        format.html { render :edit }
        format.json { render json: @infopopup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infopopups/1
  # DELETE /infopopups/1.json
  def destroy
    @infopopup.destroy
    respond_to do |format|
      format.html { redirect_to infopopups_url, notice: 'Infopopup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_infopopup
      @infopopup = Infopopup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def infopopup_params
      params.require(:infopopup).permit(:title, :body, :code)
    end
end
