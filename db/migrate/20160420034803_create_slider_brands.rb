class CreateSliderBrands < ActiveRecord::Migration
  def change
    create_table :slider_brands do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
