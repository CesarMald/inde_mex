class CreateProductConnections < ActiveRecord::Migration
  def change
    create_table :product_connections, force: true, id: false do |t|
      t.integer :product_a_id, null: false
      t.integer :product_b_id, null: false
    end
  end
end
