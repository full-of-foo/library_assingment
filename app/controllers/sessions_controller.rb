class SessionsController < ApplicationController

  def new
  end

  def create
    auth = Authentication.new(params)
    if auth.authenticated?
      Session.new(auth.user, cookies).sign_in
      redirect_back_or sti_user_path(auth.user.type, auth.user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    Session.new(current_user, cookies).sign_out

    redirect_to root_url
  end

end
