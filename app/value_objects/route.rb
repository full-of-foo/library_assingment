class Route
  attr_accessor :resource
  attr_accessor :action

  def initialize(params)
    @resource = params[:controller]
    @action   = params[:action]
  end

  def sessionless?
    all_sessionless.any? { |route| self == route }
  end

  def user_shared?
    all_shared.any? { |route| self == route }
  end

  def ownable?
    all_ownables.any? { |route| self == route }
  end

  def adminable?
    (all_adminables.any? { |route| self == route }) || user_shared?
  end

  def customerable?
    !(all_adminables.any? { |route| self == route }) || user_shared?
  end

  def ==(route)
    @resource == route.resource && @action == route.action
  end


  private

    def all_ownables
      [
        Route.new(controller: 'customers',   action: 'edit'),
        Route.new(controller: 'customers',   action: 'update'),
        Route.new(controller: 'customers',   action: 'show'),
        Route.new(controller: 'admins',      action: 'edit'),
        Route.new(controller: 'admins',      action: 'update'),
        Route.new(controller: 'admins',      action: 'show'),
        Route.new(controller: 'addresses',   action: 'edit'),
        Route.new(controller: 'addresses',   action: 'update'),
        Route.new(controller: 'purchases',   action: 'index')
      ]
    end

    def all_sessionless
      [
        Route.new(controller: 'static_pages', action: 'home'),
        Route.new(controller: 'static_pages', action: 'help'),
        Route.new(controller: 'static_pages', action: 'about'),
        Route.new(controller: 'sessions',     action: 'new'),
        Route.new(controller: 'sessions',     action: 'create'),
        Route.new(controller: 'customers',    action: 'new'),
        Route.new(controller: 'customers',    action: 'create')
      ]
    end

    def all_shared
      [
        Route.new(controller: 'sessions',    action: 'destroy'),
        Route.new(controller: 'customers',   action: 'show'),
        Route.new(controller: 'users',       action: 'destroy'),
        Route.new(controller: 'customers',   action: 'edit'),
        Route.new(controller: 'customers',   action: 'update'),
        Route.new(controller: 'books',       action: 'index'),
        Route.new(controller: 'books',       action: 'show'),
        Route.new(controller: 'reviews',     action: 'show'),
        Route.new(controller: 'purchases',   action: 'index'),
      ]
    end

    def all_adminables
      [
        Route.new(controller: 'users',       action: 'index'),
        Route.new(controller: 'admins',      action: 'new'),
        Route.new(controller: 'admins',      action: 'create'),
        Route.new(controller: 'admins',      action: 'edit'),
        Route.new(controller: 'admins',      action: 'update'),
        Route.new(controller: 'admins',      action: 'destroy'),
        Route.new(controller: 'admins',      action: 'show'),
        Route.new(controller: 'book_stocks', action: 'create_or_destroy_multiple')
      ]
    end

end
