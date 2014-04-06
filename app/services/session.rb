class Session

  def initialize(user, cookies)
    @user    = user
    @cookies = cookies
  end

  def sign_in
    remember_token = ApplicationController.helpers.base64_remember_token
    @cookies.permanent[:remember_token] = remember_token

    @user.update_attribute(:remember_token, ApplicationController.helpers
                            .hash_token(remember_token))

    ApplicationController.helpers.current_user = @user
  end

  def sign_out
    @user
      .update_attribute(:remember_token, ApplicationController.helpers
                          .hash_token(ApplicationController.helpers.base64_remember_token))

    @cookies.delete(:remember_token)
    ApplicationController.helpers.current_user = nil
  end

end
