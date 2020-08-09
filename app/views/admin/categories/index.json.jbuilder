json.set! :data do
  json.array! @categories do |category|
    json.id category.id
    json.name category.name
    json.occasion category&.occasion&.name
    json.super_category @super_categories[category.super_category_id].name
    json.created_at category.created_at
    json.updated_at category.updated_at
    json.url  "
              #{link_to 'Show', admin_category_path(category) }
              #{link_to 'Edit', edit_admin_category_path(category)}
              #{link_to 'Destroy', admin_category_path(category), method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end