class PicturesController < ApplicationController
  
  def create
    @picture = Picture.new(picture_params)
    @picture.save
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
  end

  private

  def picture_params
    params.require(:picture).permit(:picturable_id, :picturable_type, :image)
  end
end
