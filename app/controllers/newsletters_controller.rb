class NewslettersController < ApplicationController

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
