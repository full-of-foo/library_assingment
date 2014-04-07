class BookPresenter < BasePresenter
  presents :book

  def image_container
    content_tag :span, class: "pull-right user-show-grav-container" do
      concat image_tag book.image_url.to_s
    end
  end

  def price_attribute_content
    detail_content price_attribute(book.price)
  end

  def average_ratings_label
    detail_label "Average Rating: #{book.average_rating} (#{book.ratings.size} votes)"
  end

  def average_ratings_div
    content_tag(:div, id: "star", style: "margin-left: auto; margin-right: auto;") {}
  end

  def customer_rating_label
    detail_label "Your Rating:"
  end

  def customer_rating_div
    content_tag(:div, id: "customer-star", style: "margin-left: auto; margin-right: auto;") {}
  end

  def stock_counter_span
    content_tag :span do
      concat stock_count_span
      if book.stock_count == 0
        concat content_tag(:div, "Cannot purchase book :(", class: "alert alert-danger small")
      else
        concat link_to('Add to cart', cart_add_path(book), class: "btn btn-primary")
      end
    end
  end

  def review_link(review)
    link_to truncate(review.message), review_path(review)
  end

  def rating_form(rating = nil)
    form_url    = rating ? book_rating_path(book, rating) : book_ratings_path(book)
    form_method = rating ? :put : :post

    form_tag(form_url, method: form_method, id: 'customer-rating') do
      text_field(:rating, :amount, style: "visibility:hidden;")
    end
  end

  def review_submissions_span(review = nil)
    content_tag :span, class: "pull-right user-show-grav-container" do
      if review
        concat link_to 'Update Review', edit_book_review_path(book, review), class: "btn btn-primary"
      else
        concat link_to 'Make Review', new_book_review_path(book), class: "btn btn-primary"
      end
    end
  end

  def stock_form
    form_tag(book_book_stocks_path(book), method: :post) do
      content_tag :span do
        concat select_tag :stock_count, options_for_select((0..100), book.stock_count)
        concat submit_tag "Update", class: "btn btn-primary"
      end
    end
  end

  def ratings_star_script(customer_rating)
    javascript_tag ratings_js_str(customer_rating)
  end


  private

    def stock_count_span
      content_tag :span, "#{book.stock_count} "
    end

    def ratings_js_str(rating)
      customer_score = rating ? rating.formated_amount.to_s : 0

      "$('#star').raty({
        readOnly: true,
        score: #{book.average_rating},
        path: '/assets',
        width: 150,
        half: true
      });
      var customerScore = #{customer_score};
      $('#customer-star').raty({
        score: customerScore,
        path: '/assets',
        width: 150,
        half: true,
        click: function(score, evt) {
          $('#customer-rating #rating_amount').attr('value', score);
          $('form#customer-rating').submit();
        }
      });"
    end

end
