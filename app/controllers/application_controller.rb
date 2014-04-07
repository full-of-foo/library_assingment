class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :sort_column,
                :sort_direction,
                :customer_has_ownership?,
                :permitted_params
  include ApplicationHelper
  include SessionsHelper
  include UsersHelper
  include BooksHelper

  def permitted_params
    @permitted_params ||= PermittedParams.new(params, current_user)
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end

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
