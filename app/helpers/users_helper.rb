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

  def signed_in_user
    if !signed_in?
      store_location
      flash[:warning] = "Please sign in"
      redirect_to signin_url
    end
  end

  def sessionless_user
    redirect_back_or(books_path) if signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) if !current_user?(@user)
  end

  def correct_user_or_admin
    @user = User.find(params[:id] || params[:customer_id])
    redirect_to(root_url) if !current_user?(@user) && current_user.type != "Admin"
  end

  def correct_address_customer
    @user = Customer.find(params[:customer_id])
    redirect_to(root_url) if !current_user?(@user)
  end

  def permitted_admin
    not_found if current_user.type != "Admin"
  end

end
