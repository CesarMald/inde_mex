class CreateSliderBrandItems < ActiveRecord::Migration
  def change
    create_table :slider_brand_items do |t|
      t.integer :slider_id
      t.integer :brand_id
      t.string :url_link

      t.timestamps null: false
    end
  end
end
