class BooksController < ApplicationController
  before_action :signed_in_user
  helper_method :sort_column, :sort_direction

  def index
    @books = Book.search(params[:search]).order(sort_column + " " + sort_direction)
      .paginate(page: params[:page], per_page: 10)
  end

  def show
    @book = Book.find(params[:id])
  end


  private

    def sort_column
      cols = Array.new(Book.column_names) + ["authors.full_name", "topics.title", "book_stock_count"]

      (cols.include?(params[:sort])) ? params[:sort] : "books.title"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
