class HomeController < ApplicationController
 layout 'application'
  def index
    @brands = Brand.includes(:models)
    @collections = Collection.all.each_slice(Collection.count / 2)
  end
end
