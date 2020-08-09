  json.set! :data do
   json.array! @add_ons do |add_on|
    json.id add_on.id
    json.name add_on.name
    json.price add_on.price
    json.sub_category_id add_on.sub_category.name
    json.created_at add_on.created_at
    json.updated_at add_on.updated_at
    json.url  "
              #{link_to 'Show', admin_add_on_path(add_on) }
              #{link_to 'Edit', edit_admin_add_on_path(add_on)}
              #{link_to 'Destroy', admin_add_on_path(add_on), method: :delete, data: { confirm: 'Are you sure?' }}
              "
   end
  end
