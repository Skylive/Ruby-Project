json.array!(@admins) do |admin|
  json.extract! admin, :id, :login, :password
  json.url admin_url(admin, format: :json)
end
