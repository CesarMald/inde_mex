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
    @products = @brand.products
    search_products_based_on_price if params[:product_order].present?
  end

  def model_section
    @model = Model.find(params[:id])
    @products = @model.products
    search_products_based_on_price if params[:product_order].present?
  end
  
  def collections_section
    @collections_for_section = Collection.all
  end

  def collection_section
    @collection = Collection.find(params[:id])
    @products = @collection.products
    search_products_based_on_price if params[:product_order].present?
  end

  def newest_section
    @products = Product.order("created_at DESC").limit(20)
    @interior_builders = InteriorBuilder.includes(:picture).order(:position)
    search_products_based_on_price if params[:product_order].present?
  end

  def product_section
    @product = Product.find(params[:id])
    
  end

  def offer_section
    @products = Product.on_offer
    @offer_builder = OfferBuilder.first
    search_products_based_on_price if params[:product_order].present?
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
    @brands = Brand.includes(:models)
    @collections = Collection.all.each_slice(Collection.count / 2)
    @q = Product.ransack(params[:q])
  end

  def search_products_based_on_price
    direction = (params[:product_order] == "highest") ? "DESC" : "ASC"
    if params[:action] == "offer_section"
      @products = @products.order("#{sort_by} #{direction}")
    else
      @products = @products.unscoped.order("#{sort_by} #{direction}")
    end
  end

  def sort_by
    case 
    when current_user.nil? then "regular_price"
    when current_user.premium? then "premium_price"
    when current_user.regular? then "offer_price"
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
end
