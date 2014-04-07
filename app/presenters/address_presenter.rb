class AddressPresenter < BasePresenter
  presents :address

  def item_attribute_spans
    delimitable_attrs = ["line1", "line2", "city", "state"]

    content_tag :span do
      delimitable_attrs.each do |attr_str|
        attr_value = address.send(attr_str)
        concat content_tag(:span, "#{attr_value}, ") if !attr_value.blank?
      end
      concat content_tag(:span, address.country)
    end
  end

  def update_link(text = "Update")
    link_to text, edit_customer_address_path(current_user, address), class: "btn btn-success"
  end

  def remove_link(text = "Remove")
    confirm_text = "Will also delete purchase histories of this address! You sure?"

    link_to text, customer_address_path(current_user, address),
      method: :delete, data: { confirm: confirm_text }, class: "btn btn-danger"
  end


end
