module LineItemsHelper

  def style_for_price product, user
    if product.on_offer? && user.nil?
      "rebate-price"
    else
      "normal-price"
    end
  end

  def price_for_product product, user
    if user
      if user.regular?
        number_to_currency(product.merchant_price, precision: 2)
      else
        number_to_currency(product.premium_price, precision: 2)
      end
    else
      number_to_currency(product.regular_price, precision: 2)
    end
  end
end
