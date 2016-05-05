json.array!(@members) do |member|
  json.extract! member, :id, :firstname, :lastname, :address1, :address2, :phoneno, :isactivemember
  json.url member_url(member, format: :json)
end
