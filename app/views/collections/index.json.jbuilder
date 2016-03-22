json.array!(@collections) do |collection|
  json.extract! collection, :id, :title, :description, :text_link, :url_link
  json.url collection_url(collection, format: :json)
end
