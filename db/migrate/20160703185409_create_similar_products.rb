class CreateSimilarProducts < ActiveRecord::Migration
  def change
    create_table :similar_products, force: true, id: false do |t|
      t.integer :product_a_id, null: false
      t.integer :product_b_id, null: false
    end
  end
end
