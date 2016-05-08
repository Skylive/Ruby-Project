json.array!(@members) do |member|
  json.extract! member, :id, :login, :password, :firstname, :lastname, :address1, :address2, :phoneno, :isactivemember, :isadmin
  json.url member_url(member, format: :json)
end
