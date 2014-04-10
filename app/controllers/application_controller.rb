class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authorize

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

  def customer_has_ownership?(customer, resource)
    CustomerOwnershipPolicy.new(customer, resource).has_ownership?
  end


  private

    def current_permission
      @current_permission = PermittedResourcePolicy.new(current_user, params)
    end

    def authorize
      if !current_permission.permitted?
        if current_user
          flash[:warning] = "Not authorized"
          redirect_to books_path
        else
          store_location
          flash[:warning] = "Please sign in"
          redirect_to signin_url
        end
      end
      redirect_to(books_path) if current_user && current_permission.route.sessionless?
    end

end
