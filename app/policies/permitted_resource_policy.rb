class PermittedResourcePolicy < UserPolicy
  attr_accessor :route, :params

  def initialize(user, params)
    super(user)
    @route  = Route.new(params)
    @params = params
  end

  def permitted?
    return true if route.ownable?      && @user     && has_ownership?
    return true if route.sessionless?  && !@user
    return true if route.adminable?    && admin?    && !route.ownable?
    return true if route.customerable? && customer? && !route.ownable?

    false
  end


  private

    def has_ownership?
      if updating_user_resource?
        @user == User.find(params[:id])
      elsif updating_user_nested_resource?
        @user == Customer.find(params[:customer_id])
      elsif listing_user_nested_resource?
        admin? || @user == Customer.find(params[:customer_id])
      elsif showing_user_resource?
        admin? || @user == User.find(params[:id] || params[:customer_id])
      else
        false
      end
    end

    def updating_user_resource?
      route.resource.in?(%w[customers admins]) && route.action.in?(%w[edit update])
    end

    def showing_user_resource?
      route.resource.in?(%w[customers admins]) && route.action == "show"
    end

    def updating_user_nested_resource?
      route.resource.in?(%w[addresses]) && route.action.in?(%w[edit update])
    end

    def listing_user_nested_resource?
      route.resource.in?(%w[purchases]) && route.action == "index"
    end

end
