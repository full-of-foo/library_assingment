module UsersHelper

  def sti_user_path(type = "user", user = nil, action = nil)
    send "#{format_sti(action, type, user)}_path", user
  end

  def format_sti(action, type, user)
    action || user ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end

  def gravatar_for(user, size = 50 )
    gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.full_name, class: "gravatar", size: size)
  end

end
