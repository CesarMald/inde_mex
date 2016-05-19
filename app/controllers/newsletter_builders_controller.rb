class NewsletterBuildersController < AdminController

  def index
    @newsletter_builder = NewsletterBuilder.first
    @newsletter_builder.build_picture unless @newsletter_builder.picture
  end

  def update
    @newsletter_builder = NewsletterBuilder.find(params[:id])
    if @newsletter_builder.update(newsletter_builder_attributes)
      flash[:notice] = "Newsletter actualizado exitosamente"
      redirect_to newsletter_builders_path
    else
      render :index
    end
  end

  private

  def newsletter_builder_attributes
    params.require(:newsletter_builder).permit(:title, :description, :text_link, picture_attributes: [:id, :image, :remote_image_url, :picturable_id, :picturable_type])
  end
end
