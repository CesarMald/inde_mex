class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total, default: 0.0
      t.integer :user_id
      t.decimal :subtotal, default: 0.0

      t.timestamps null: false
    end
  end
end
