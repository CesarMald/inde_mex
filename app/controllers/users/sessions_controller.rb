class Users::SessionsController < Devise::SessionsController
  before_action :load_nav_information

  def load_nav_information
    @brands = Brand.includes(:models)
    @collections = Collection.all.each_slice(Collection.count / 2)
    @q = Product.ransack(params[:q])
  end

end
