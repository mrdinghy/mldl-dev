class SiteDocumentsController < ApplicationController
  before_action :set_site_document, only: [:show, :edit, :update, :destroy]

  # GET /site_documents
  # GET /site_documents.json
  def index
    @site_documents = SiteDocument.all
  end

  # GET /site_documents/1
  # GET /site_documents/1.json
  def show
  end

  # GET /site_documents/new
  def new
    @site_document = SiteDocument.new
  end

  # GET /site_documents/1/edit
  def edit
  end

  # POST /site_documents
  # POST /site_documents.json
  def create

    @site_document = SiteDocument.new(site_document_params)
    dtype = @site_document.documentable_type
    did = @site_document.documentable_id
    if dtype == 'post'
      d = Post.find(did)
    elsif dtype == 'meeting'
      d = Meeting.find(did)
    elsif dtype == 'issue'
      d = Issue.find(did)
    end





    respond_to do |format|
      if @site_document.save
        format.html { redirect_to d, notice: 'Site document was successfully created.' }
        format.json { render :show, status: :created, location: @site_document }
      else
        format.html { render :new }
        format.json { render json: @site_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_documents/1
  # PATCH/PUT /site_documents/1.json
  def update


    respond_to do |format|
      if @site_document.update(site_document_params)
        format.html { redirect_to @site_document, notice: 'Site document was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_document }
      else
        format.html { render :edit }
        format.json { render json: @site_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_documents/1
  # DELETE /site_documents/1.json
  def destroy
    @site_document.destroy
    respond_to do |format|
      format.html { redirect_to site_documents_url, notice: 'Site document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_document
      @site_document = SiteDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_document_params
      params.require(:site_document).permit(:name, :documentable_type, :documentable_id, :document)
    end
end
