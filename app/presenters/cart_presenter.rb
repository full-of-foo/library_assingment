class CartPresenter < BasePresenter
  presents :shopping_cart

  def clear_all_link(text = "Clear all")
    link_to text, cart_clear_path, class: "btn btn-danger"
  end

  def checkout_link(text = "Checkout")
    link_to text, new_purchase_path, class: "btn btn-success"
  end

  def remove_link(text = "Remove", book)
    link_to text, cart_remove_path(book), class: "btn btn-danger"
  end

  def total_cost_title_div
    content_tag :div do
      concat detail_label("Total Cost: ")
      concat content_tag :span, number_to_currency(carted_books_total_cost, unit: "€")
    end
  end

end
