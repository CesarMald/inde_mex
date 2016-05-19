class OfferBuildersController < AdminController

  def index
    @offer_builder = OfferBuilder.first
    @offer_builder.build_picture unless @offer_builder.picture
  end

  def update
    @offer_builder = OfferBuilder.find(params[:id])
    if @offer_builder.update(offer_builder_attributes)
      flash[:notice] = "Sección de Oferta actualizado exitosamente"
      redirect_to offer_builders_path
    else
      render :index
    end
  end

  private

  def offer_builder_attributes
    params.require(:offer_builder).permit(picture_attributes: [:id, :image, :remote_image_url, :picturable_id, :picturable_type])
  end
end
