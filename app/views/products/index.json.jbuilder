json.array!(@products) do |product|
  json.extract! product, :id, :brand_id, :model_id, :name, :code, :regular_price, :offer_price, :description
  json.url product_url(product, format: :json)
end
