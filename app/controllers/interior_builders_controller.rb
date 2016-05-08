class InteriorBuildersController < AdminController

  def show
    @interior_builder = InteriorBuilder.find_by(position: params[:position])
    @interior_builder.build_picture unless @interior_builder.picture
  end

  def update
    @interior_builder = InteriorBuilder.find_by(position: params[:position])
    if @interior_builder.update(interior_builder_attributes)
      flash[:notice] = "Interior builder actualizado exitosamente"
      redirect_to interior_builder_path(@interior_builder.position)
    else
      render :show
    end
  end

  private

  def interior_builder_attributes
    params.require(:interior_builder).permit(:title, :description, :link_url, :hover_title, :hover_description, picture_attributes: [:id, :image, :remote_image_url, :picturable_id, :picturable_type])
  end
end
