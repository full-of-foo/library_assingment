class UserPresenter < BasePresenter
  presents :user

  def show_addresses_title(has_add_address_link = false)
    if has_add_address_link
      content_tag(:div) do
        concat address_title
        concat add_address_link
      end
    else
      address_title
    end
  end

  def address_title
    content_tag :span, "Billing Addresses: (#{user.addresses.count}) ", class: "text-info"
  end

  def gravatar(size = 50)
    gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"

    image_tag(gravatar_url, alt: user.full_name, class: "gravatar", size: size)
  end

  def edit_link(text = "Update")
    link_to text, sti_user_path(user.type, user, "edit"), class: "btn btn-success"
  end

  def delete_link(text = "Delete Account")
    link_to text, user, method: :delete, data: { confirm: "You sure?" }, class: "btn btn-danger"
  end

  def add_address_link(text = "Add")
    link_to text, new_customer_address_path(user), id: "add-address", class: "btn btn-success"
  end

  def purchase_history_link
    link_to "Purchase History", customer_purchases_path(user), class: "btn btn-success" if current_user.type == "Admin"
  end

end
