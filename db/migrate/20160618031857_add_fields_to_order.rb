class AddFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_price, :decimal, default: 0.0
    add_column :orders, :tax_price, :decimal, default: 0.0
  end
end
