class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @myactions = Issueaction.where('issue_id=?', @issue.id).order('created_at DESC')
    @mymeetings = Meeting.where('structure_id=?', @issue.structure_id)
    @raisedby = Person.find(@issue.raised_by) if @issue.raised_by
    @issueaction = Issueaction.new
    @issuedocs = SiteDocument.where('documentable_type = ? and documentable_id = ?', 'issue', @issue.id)
    @new_site_document = SiteDocument.new
    parent_id = @issue.structure.parent_id if @issue.structure.parent_id
    @parent = Structure.find(parent_id) if parent_id
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    @issue.structure_id = params[:structure_id] if params[:structure_id]
    if params[:meeting_id]
        @meeting = Meeting.find(params[:meeting_id])
    end
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    if params[:meeting_id]
      @issue.structure_id = params[:structure_id]
      meeting = Meeting.find(params[:meeting_id])

      @issue.save

      Issueaction.create(actiontype_id: 2, structure_id:  params[:structure_id], meeting_id: params[:meeting_id], issue_id: @issue.id)

     end
    if params[:structure_id]
       structure = Structure.find(params[:structure_id])
      @issue.structure_id = params[:structure_id]
      @issue.status_id=1
      #Issueaction.create(structure_id: structure.id, issue_id: @issue.id, actiontype: 1, user_id: current_user.id)
    end

    @issue.save



    respond_to do |format|
      if @issue.save
        if params[:meeting_id]
           format.html { redirect_to meeting, notice: 'Issue was successfully created.' }
           format.json { render :show, status: :created, location: meeting }
        elsif params[:structure_id]
          format.html { redirect_to structure, notice: 'Issue was successfully created.' }
          format.json { render :show, status: :created, location: structure }
        else

          format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
          format.json { render :show, status: :created, location: @issue }
        end


      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update


    if params[:addraiser]
      peep=Person.create(name_first: params[:fname], name_last: params[:lname], email: params[:email], title: params[:title])


      @issue.raised_by = peep.id



    end
    puts '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
    puts @issue.raised_by

    @issue.save

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end



    def addnote




      @issueaction=Issueaction.new()
      @issueaction.issue_id = params[:issue_id]
      @issueaction.actionbody = params[:actionbody]
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Action note was successfully updated.' }
      end
    end
  end

  def loadissues
    getissues = Appissue.where('issuename is not NULL')

    getissues.each do |i|

      if i.structurecode=='CL'
        vstrct='1'
      elsif i.structurecode=='DSC'
        vstrct='2'
      elsif i.structurecode=='DSC'
        vstrct='2'
      elsif i.structurecode=='DSC'
        vstrct='2'
      elsif i.structurecode=='DSC'
        vstrct='2'

      end



      new1=Issue.create(name: i.issuename, description: i.issuedesc, )


    end




  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:name, :description, :structure_id, :community, :yourname, :district_id, :location, :status_id, :status_note,
                                    :actionplan, :category_id, :resolution_date, :raised_by, :disputant, :scope_id, :actioncommittee )
    end
end

