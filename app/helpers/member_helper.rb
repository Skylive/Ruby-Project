module MemberHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(member)
    gravatar_id = Digest::MD5::hexdigest(member.login.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: member.firstname, class: "gravatar")
  end
end
