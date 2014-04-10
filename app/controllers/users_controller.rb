class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    user            = User.find(params[:id])
    redirect_url    = current_user?(user) ? signin_url : users_url

    user.destroy

    flash[:success] = "Account deleted"
    redirect_to redirect_url
  end

end
