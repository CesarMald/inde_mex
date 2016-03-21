class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :brand_id
      t.integer :model_id
      t.string :name
      t.string :code
      t.decimal :regular_price
      t.decimal :offer_price
      t.string :description

      t.timestamps null: false
    end
  end
end
