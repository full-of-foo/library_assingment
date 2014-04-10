class AdminsController < ApplicationController

  def new
    @user = Admin.new
  end

  def create
    @user = Admin.new(permitted_params.user)
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
    if @user.update_attributes(permitted_params.user)
      flash[:success] = "Profile updated"
      redirect_to sti_user_path("Admin", @user)
    else
      render 'users/edit'
    end
  end

end
