class HomeController < ApplicationController
 layout 'application'
 before_filter :load_core_objects
 before_filter :load_current_cart

  def index
    @sliders = Slider.includes(:picture)
    @slider_brand = SliderBrand.first
    @items = @slider_brand.items.includes(:picture)
    @complete_banners = Banner.includes(:picture).complete.order(:position)
    @half_banners = Banner.includes(:picture).half.order(:position)
    @newsletter_builder = NewsletterBuilder.first
  end

  def brands_section
    @models = Model.all
  end

  def brand_section
    @brand = Brand.find(params[:id])
    @products = @brand.products.active
    search_products_based_on_price if params[:product_order].present?
  end

  def model_section
    @model = Model.find(params[:id])
    @products = @model.products.active
    search_products_based_on_price if params[:product_order].present?
  end
  
  def collections_section
    @collections_for_section = Collection.all
  end

  def collection_section
    @collection = Collection.find(params[:id])
    @products = active_products.where(collection_id: @collection.id)
    search_products_based_on_price if params[:product_order].present?
  end

  def newest_section
    @products = active_products.order("products.created_at DESC").limit(20)
    @interior_builders = InteriorBuilder.includes(:picture).order(:position)
    search_products_based_on_price if params[:product_order].present?
  end

  def product_section
    @product = Product.find(params[:id])
    
  end

  def offer_section
    @products = active_products.on_offer
    @offer_builder = OfferBuilder.first
    sort_offer_products if params[:product_order].present?
  end

  def contact_section
  end

  def search_section
    @products = @q.result
    search_products_based_on_price if params[:product_order].present?
  end

  def make_contact
    name = params[:name]
    email = params[:email]
    tel = params[:tel]
    message = params[:message]
    ContactMailer.send_notification_to_admin(name, email, tel, message).deliver_now
    flash[:notice] = "Gracias por contactarnos. Te responderemos pronto"
    redirect_to root_path
  end

  private 

  def load_core_objects
    @brands = Brand.active.includes(:models)
    @collections = Collection.all.each_slice(Collection.count / 2)
    @q = Product.active.ransack(params[:q])
  end

  def sort_offer_products
    @products = @products.sort_by { |product| product.offer_price } 
    if params[:product_order] == "highest"
      @products.reverse! 
    end
  end

  def search_products_based_on_price
    @products = @products.sort_by { |product| product.assigned_price(current_user) }
    if params[:product_order] == "highest"
      @products.reverse! 
    end
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

  def active_products
    Product.joins(:model, :brand).active.merge(Model.active).merge(Brand.active)
  end

end
