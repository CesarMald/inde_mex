class HomeController < ApplicationController
 layout 'application'
  def index
    @brands = Brand.includes(:models)
    @collections = Collection.all.each_slice(Collection.count / 2)
    @sliders = Slider.all
    @slider_brand = SliderBrand.first
    @items = @slider_brand.items
    @complete_banners = Banner.complete.order(:position)
    @half_banners = Banner.half.order(:position)
  end
end
