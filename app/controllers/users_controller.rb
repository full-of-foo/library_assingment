class UsersController < ApplicationController
  before_action :signed_in_user
  before_action :permitted_admin, only: :index

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    user            = User.find(params[:id])
    is_current_user = current_user?(user)
    redirect_url    = is_current_user ? signin_url : users_url

    user.destroy

    flash[:success] = "Account deleted"
    redirect_to redirect_url
  end

end
