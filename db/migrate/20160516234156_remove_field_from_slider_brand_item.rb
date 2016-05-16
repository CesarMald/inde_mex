class RemoveFieldFromSliderBrandItem < ActiveRecord::Migration
  def change
    remove_column :slider_brand_items, :url_link
  end
end
