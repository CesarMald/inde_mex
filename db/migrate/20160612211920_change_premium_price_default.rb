class ChangePremiumPriceDefault < ActiveRecord::Migration
  def change
    change_column_default :products, :premium_price, nil
  end
end
