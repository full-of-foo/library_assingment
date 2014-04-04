class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  include SessionsHelper
  include UsersHelper
  include AddressesHelper
  include BooksHelper
  include PurchasesHelper

  helper_method :sort_column, :sort_direction

  def sort_column
    cols = Array.new(Book.column_names) + ["authors.full_name", "topics.title", "book_stock_count"]

    (cols.include?(params[:sort])) ? params[:sort] : "books.title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
