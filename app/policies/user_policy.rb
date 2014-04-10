class UserPolicy

  def initialize(user = nil)
    @user = user
  end

  private

    def admin?
      @user && @user.type == "Admin"
    end

    def customer?
      @user && @user.type == "Customer"
    end

end
