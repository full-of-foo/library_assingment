class Authentication

  def initialize(params)
    @params = params
  end

  def user
    @user ||= user_with_password
  end

  def authenticated?
    user.present?
  end


  private

    def user_with_password
      user = User.find_by(email: @params[:session][:email].downcase)
      user && user.authenticate(@params[:session][:password])
    end

end
