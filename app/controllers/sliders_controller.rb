class SlidersController < AdminController

  def index
    @sliders = Slider.order(:created_at)
    @sliders.each do |slider|
      slider.build_picture unless slider.picture
    end
  end

  def update
    @slider = Slider.find(params[:id])
    if @slider.update(slider_params)
      redirect_to sliders_path, notice: "Slider was successfully updated"
    else
      render :index
    end
  end

  private

  def slider_params
    params.require(:slider).permit(:title, :url_link, :description, :link_text, picture_attributes: [:id, :image, :remote_image_url, :picturable_id, :picturable_type])
  end
end
