class AddMerchantPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :merchant_price, :decimal
  end
end
