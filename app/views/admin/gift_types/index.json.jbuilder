json.set! :data do
  json.array! @gift_types do |gift_type|
    json.id gift_type.id
    json.name gift_type.name
    json.icon image_tag rails_blob_path(gift_type.icon), width: '80x80' if gift_type.icon.attached?
    json.created_at gift_type.created_at.strftime("%m/%d/%y %H:%m")
    json.updated_at gift_type.updated_at.strftime("%m/%d/%y %H:%m")
    json.url  "
              #{link_to 'Show', admin_gift_type_path(gift_type) }
              #{link_to 'Edit', edit_admin_gift_type_path(gift_type)}
              #{link_to 'Destroy', admin_gift_type_path(gift_type), method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end