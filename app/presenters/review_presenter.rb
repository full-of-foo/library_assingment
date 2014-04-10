class ReviewPresenter < BasePresenter
  presents :review

  def edit_link(text = "Update")
    link_to text, edit_book_review_path(review.book, review), class: "btn btn-success"
  end

  def delete_link(text = "Delete")
    link_to text, customer_review_path(current_user, review),
      method: :delete, data: { confirm: "You sure?" }, class: "btn btn-danger"
  end

end
