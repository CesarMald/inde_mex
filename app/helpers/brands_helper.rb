module BrandsHelper

  def brands_combo
    Brand.all.map{ |brand| [brand.name, brand.id] }
  end
end
