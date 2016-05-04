class AddPremiumPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :premium_price, :decimal, default: 0.0
  end
end
