class SliderBrandsController < AdminController

  def index
    @slider_brand = SliderBrand.first
    @items = @slider_brand.items
    @items.each do |item|
      item.build_picture unless item.picture
    end
  end

  def update
    @slider_brand = SliderBrand.find(params[:id])
    if @slider_brand.update(slider_brand_params)
      redirect_to slider_brands_path, notice: "Slider brand was successfully updated"
    else
      render :index
    end
  end

  private

  def slider_brand_params
    attributes = params[:slider_brand]
    attributes[:items_attributes].each_pair do |key, value|
      attributes[:items_attributes][key] = attributes[:items_attributes][key][:items] if attributes[:items_attributes][key].key?("items")
    end
    params.require(:slider_brand).permit(:name, :description, items_attributes: [:id, :brand_id, :url_link, :_destroy, picture_attributes: [:id, :image, :remote_image_url, :picturable_id, :picturable_type]])
  end
end
