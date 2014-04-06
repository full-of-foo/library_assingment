class CustomerOwnershipPolicy < UserPolicy

  def initialize(user, resource)
    super(user)
    @resource         = resource
    @resource_klasses = [Address, Purchase, Review, Rating]
  end

  def has_ownership?
    if @resource_klasses.any? { |klass| @resource.class == klass }
      @user.class == Customer && @user == @resource.customer
    else
      false
    end
  end

end
