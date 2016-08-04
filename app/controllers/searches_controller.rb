class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index

    @search = Resource.search do
      fulltext params[:search_term]


      with(:technicalarea_ids, params[:technicalarea_ids])
      #with(:technicalarea_ids, [1,6])
      #with(:targetgroup_ids, [3,7,9])

      #with(:organization_id) .any_of([3,4,5,6,7,8,9,42])
      #with(:series_id) .any_of([1,2,256])
    end


    @resources = @search.results
    render 'resources/search_results'

  end

  # GET /searches/1
  # GET /searches/1.json
  def show

    @thissearch = Resource.search do
      fulltext @search.search_term
      #with(:technicalarea_ids, [1, 3, 5])


    end


    @resources = @thissearch.results




  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:search_term, technicalarea_ids: [], targetgroup_ids: [], organization_ids: [])
    end
end
