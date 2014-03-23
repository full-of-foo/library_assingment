class AdminsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user,          only: [:edit, :update]
  before_action :correct_user_or_admin, only: [:edit, :update, :show]

  def new
    @user = Admin.new
  end

  def create
    @user = Admin.new(user_params())
    if @user.save
      flash[:success] = "Profile created"
      redirect_to sti_user_path("Admin", @user)
    else
      render "admins/new"
    end
  end

  def show
    @user = Admin.find(params[:id])
  end

  def edit
    @user = Admin.find(params[:id])
    render "users/edit"
  end

  def update
    @user = Admin.find(params[:id])
    if @user.update_attributes(user_params())
      flash[:success] = "Profile updated"
      redirect_to sti_user_path("Admin", @user)
    else
      render 'users/edit'
    end
  end

end
