module BrandsHelper

  def brands_combo
    Brand.all.map{ |brand| [brand.name, brand.id] }
  end

  def simplest_brands_combo
    Brand.pluck(:name)
  end

end
