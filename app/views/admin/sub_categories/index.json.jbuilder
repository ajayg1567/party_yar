json.set! :data do
  json.array! @sub_categories do |sub_category|
    json.id sub_category.id
    json.name sub_category.name
    json.category "#{@categories[sub_category.category_id].name} - #{@super_categories[@categories[sub_category.category_id].super_category_id].name}"
    json.created_at sub_category.created_at
    json.updated_at sub_category.updated_at
    json.url  "
              #{link_to 'Show', admin_sub_category_path(sub_category) }
              #{link_to 'Edit', edit_admin_sub_category_path(sub_category)}
              #{link_to 'Destroy', admin_sub_category_path(sub_category), method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end