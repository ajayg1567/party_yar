json.set! :data do
  json.array! @users do |user|
    json.id user.id
    json.name user.name
    json.email user.email
    json.phone user.phone
    json.created_at user.created_at.to_s
    json.updated_at user.updated_at.to_s
    json.url  "
              #{link_to 'Show', admin_user_path(user) }
              #{link_to 'Destroy', admin_user_path(user), method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end