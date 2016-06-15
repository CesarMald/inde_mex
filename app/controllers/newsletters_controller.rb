class NewslettersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy]
  layout "backend", only: :index

  def index
    @newsletters = Newsletter.all
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    flash[:notice] = "Se ha eliminado el correo exitosamente!"
    redirect_to newsletters_path
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    if @newsletter.save
      flash[:notice] = "¡Gracias por suscribirte a nuestro newsletter!. Espera noticias nuestras muy pronto"
    else
      flash[:alert] = "Ya estás inscrito a nuestro newsletter"
    end
    redirect_to root_path
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end
end
