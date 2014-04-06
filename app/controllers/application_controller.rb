class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :sort_column, :sort_direction, :customer_has_ownership?

  include ApplicationHelper
  include SessionsHelper
  include UsersHelper
  include AddressesHelper
  include BooksHelper
  include PurchasesHelper

  def sort_column
    cols = Array.new(Book.column_names) + ["authors.full_name", "topics.title", "book_stock_count"]

    (cols.include?(params[:sort])) ? params[:sort] : "books.title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def customer_has_ownership?(customer, resource)
    CustomerOwnershipPolicy.new(customer, resource).has_ownership?
  end

end
