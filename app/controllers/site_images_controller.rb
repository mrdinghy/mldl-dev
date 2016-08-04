class SiteImagesController < ApplicationController
  before_action :set_site_image, only: [:show, :edit, :update, :destroy]

  # GET /site_images
  # GET /site_images.json
  def index
    @site_images = SiteImage.all
  end

  # GET /site_images/1
  # GET /site_images/1.json
  def show
  end

  # GET /site_images/new
  def new
    @site_image = SiteImage.new
  end

  # GET /site_images/1/edit
  def edit
  end

  # POST /site_images
  # POST /site_images.json
  def create
     @site_image = SiteImage.new(site_image_params)

    itype = @site_image.imageable_type
    iid = @site_image.imageable_id
    if itype == 'post'
      i = Post.find(iid)
    elsif itype == 'resource'
      i = Resource.find(iid)
    elsif itype == 'series'
      i = Series.find(iid)
    end


    respond_to do |format|
      if @site_image.save

                
        format.html { redirect_to i, notice: 'Site image was successfully created.' }
        format.json { render :show, status: :created, location: @site_image }
      else
        format.html { render :new }
        format.json { render json: @site_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_images/1
  # PATCH/PUT /site_images/1.json
  def update





    respond_to do |format|
      if @site_image.update(site_image_params)
        format.html { redirect_to @site_image, notice: 'Site image was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_image }
      else
        format.html { render :edit }
        format.json { render json: @site_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_images/1
  # DELETE /site_images/1.json
  def destroy
    @site_image.destroy
    respond_to do |format|
      format.html { redirect_to site_images_url, notice: 'Site image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
















  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_image
      @site_image = SiteImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_image_params
      params.require(:site_image).permit(:name, :imageable_type, :imageable_id, :image, :is_logo)
    end
end
