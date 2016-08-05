class IssueactionsController < ApplicationController
  before_action :set_issueaction, only: [:show, :edit, :update, :destroy]

  # GET /issueactions
  # GET /issueactions.json
  def index
    @issueactions = Issueaction.all
  end

  # GET /issueactions/1
  # GET /issueactions/1.json
  def show
  end

  # GET /issueactions/new
  def new
    @issueaction = Issueaction.new
  end

  # GET /issueactions/1/edit
  def edit
  end

  # POST /issueactions
  # POST /issueactions.json
  def create
    @issueaction = Issueaction.new(issueaction_params)

      issue = Issue.find(params[:issue_id])
      @issueaction.issue_id = params[:issue_id]
      @issueaction.actiontype_id = params[:actiontype_id]
      if params[:actiontype_id] == '5'
        issue.structure_id = params[:parent_id]
        issue.save
        @issueaction.laststructure_id = params[:issue_id]
      end

    if params[:actiontype_id] == '7'
      issue.resolution_date = DateTime.now
      issue.resolution = params[:issueaction][:actionbody]
      issue.save
    end

    if params[:actiontype_id] == '10'
      @issueaction.old_resolution_date = issue.resolution_date
      issue.resolution_date = nil
      issue.save
    end


    @issueaction.save



    respond_to do |format|
      if @issueaction.save
        format.html { redirect_to issue, notice: 'issueaction was successfully created.' }
        format.json { render :show, status: :created, location: @issueaction }
      else
        format.html { render :new }
        format.json { render json: @issueaction.errors, status: :unprocessable_entity }
      end
    end
  end
  
    # PATCH/PUT /issueactions/1
  # PATCH/PUT /issueactions/1.json
  def update
    respond_to do |format|
      if @issueaction.update(issueaction_params)
        format.html { redirect_to @issueaction, notice: 'Issueaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @issueaction }
      else
        format.html { render :edit }
        format.json { render json: @issueaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issueactions/1
  # DELETE /issueactions/1.json
  def destroy
    @issueaction.destroy
    respond_to do |format|
      format.html { redirect_to issueactions_url, notice: 'Issueaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issueaction
      @issueaction = Issueaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issueaction_params
      params.require(:issueaction).permit(:actiontype_id, :meeting_id, :organization_id, :issue_id, :actionbody, :structure_id, :user_id, :laststructure_id)
    end
end
