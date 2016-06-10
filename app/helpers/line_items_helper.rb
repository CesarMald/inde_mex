module LineItemsHelper

  def price_for_product product, user
    if user.regular?
      number_to_currency(product.offer_price, precision: 2)
    else
      number_to_currency(product.premium_price, precision: 2)
    end
  end
end
