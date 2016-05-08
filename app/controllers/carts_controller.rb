class CartsController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_core_objects
  before_filter :load_current_cart

  def detail
    @order = Order.find(session[:cart_id]) 
    @line_items = @order.line_items
  end

  def checkout
    @order = Order.find(session[:cart_id])
    @line_items = @order.line_items
  end

  def complete
    @order = Order.find(session[:cart_id])
    @order.update_attribute(:status, "completed")
    session[:cart_id] = nil
    flash[:notice] = "Se ha enviado la cotización correctamente"
    OrderMailer.send_confirmation(@order, current_user).deliver_now
    redirect_to root_path
  end

  private 

  def load_core_objects
    @brands = Brand.includes(:models)
    @collections = Collection.all.each_slice(Collection.count / 2)
    @q = Product.ransack(params[:q])
  end

  def load_current_cart
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
