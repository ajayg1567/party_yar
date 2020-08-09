json.extract! shipping_method, :id, :tag_name, :price, :created_at, :updated_at
json.url shipping_method_url(shipping_method, format: :json)
