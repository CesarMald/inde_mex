class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_base_objects, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :address
    devise_parameter_sanitizer.for(:sign_up) << :cell_phone
    devise_parameter_sanitizer.for(:sign_up) << :phone_number
    devise_parameter_sanitizer.for(:sign_up) << :company
    devise_parameter_sanitizer.for(:sign_up) << :hear_about_us
    devise_parameter_sanitizer.for(:sign_up) << :subscribed_to_newsletter
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      orders_path
    else
      root_path
    end
  end

  def load_base_objects
    @brands = Brand.active.includes(:models)
    @collections = Collection.all.each_slice(Collection.count / 2)
    @q = Product.active.ransack(params[:q])
    if user_signed_in?
      session[:cart_id] = find_or_initialize_cart
      @current_cart ||= Order.find(session[:cart_id])
      @line_item = @current_cart.line_items.build
    end
  end

  def find_or_initialize_cart
    if session[:cart_id].nil?
      order = current_user.orders.create
      session[:cart_id] = order.id
    end
    session[:cart_id]
  end

end
