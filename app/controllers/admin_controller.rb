class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_if_user_is_admin
  layout 'backend'


  private

  def verify_if_user_is_admin
    unless current_user.admin?
      flash[:alert] = "No tienes permisos para ver esta sección"
      redirect_to root_path
    end
  end
end
