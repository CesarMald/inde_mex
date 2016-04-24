class AddPremiumPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :premium_price, :decimal
  end
end
