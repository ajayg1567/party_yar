json.set! :data do
  json.array! @super_categories do |super_category|
    json.id super_category.id
    json.name super_category.name
    json.created_at super_category.created_at
    json.updated_at super_category.updated_at
    json.url  "
              #{link_to 'Show', admin_super_category_url(super_category) }
              #{link_to 'Edit', edit_admin_super_category_url(super_category)}
              #{link_to 'Destroy', admin_super_category_url(super_category), method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end