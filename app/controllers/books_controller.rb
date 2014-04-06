class BooksController < ApplicationController
  before_action :signed_in_user

  def index
    @books = Book.search(params[:search]).order(sort_column + " " + sort_direction)
      .paginate(page: params[:page], per_page: 10)
  end

  def show
    @book    = Book.find(params[:id])
    @rating  = @book.customer_rating(current_user) if @book.customer_rating(current_user)
    @reviews = @book.reviews.paginate(page: params[:page], per_page: 10)
    @review  = Review.customer_book_review(current_user, @book)
  end

end
