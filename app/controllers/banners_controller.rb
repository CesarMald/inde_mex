class BannersController < AdminController

  def show
    @banner = Banner.find_by(position: params[:position])
    @banner.build_picture unless @banner.picture
  end

  def update
    @banner = Banner.find_by(position: params[:position])
    
    if @banner.update(banner_attributes)
      flash[:notice] = "Banner actualizado exitosamente"
      redirect_to banner_path(@banner.position)
    else
      render :show
    end
  end

  private

  def banner_attributes
    params.require(:banner).permit(:title, :description, :link_url, :link_text, :hover_title, :hover_description, picture_attributes: [:id, :image, :remote_image_url, :picturable_id, :picturable_type])
  end
end
