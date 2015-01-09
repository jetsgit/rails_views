json.array!(@products) do |product|
  json.extract! product, :id, :name,, :price, :publisher_id, :rating, :discontinued
  json.url product_url(product, format: :json)
end
