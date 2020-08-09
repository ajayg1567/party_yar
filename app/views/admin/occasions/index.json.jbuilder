json.set! :data do
  json.array! @occasions do |occasion|
    json.id occasion.id
    json.name occasion.name
    json.created_at occasion.created_at
    json.updated_at occasion.updated_at
    json.url  "
              #{link_to 'Edit', edit_admin_occasion_path(occasion)}
              #{link_to 'Destroy', admin_occasion_path(occasion), method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end