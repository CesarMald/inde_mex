class HomeController < ApplicationController
 layout 'application'
 before_filter :load_core_objects

  def index
    @sliders = Slider.all
    @slider_brand = SliderBrand.first
    @items = @slider_brand.items
    @complete_banners = Banner.complete.order(:position)
    @half_banners = Banner.half.order(:position)
  end

  def model_section
    @model = Model.find(params[:id])
    @products = @model.products
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
    search_products_based_on_price if params[:product_order].present?
  end

  def product_section
    @product = Product.find(params[:id])
  end

  def offer_section
    @products = Product.on_offer
    search_products_based_on_price if params[:product_order].present?
  end

  def contact_section
  end

  def search_section
    @products = @q.result
    search_products_based_on_price if params[:product_order].present?
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
end
