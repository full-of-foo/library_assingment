class AdminsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
    @user = Admin.new
    render "users/new"
  end

  def create
    @user = Admin.new(user_params())
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Crappy-Book-Store.com!"
      redirect_to @user
    else
      render "users/new"
    end
  end

  def edit
    @user = Admin.find(params[:id])
    render "users/edit"
  end

  def update
    @user = Admin.find(params[:id])
    if @user.update_attributes(user_params())
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'users/edit'
    end
  end

end
