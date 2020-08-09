json.set! :data do
  json.array! @products do |product|
    json.id product.id
    json.name product.name
    json.price product.price
    json.sub_category_id @sub_categories[product.sub_category_id]&.name
    json.quantity product.quantity
    json.created_at product.created_at
    json.updated_at product.updated_at
    json.url  "
              #{link_to 'Show', admin_product_path(product) }
              #{link_to 'Edit', edit_admin_product_path(product)}
              #{link_to 'Destroy', admin_product_path(product), method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end