class CustomersController < ApplicationController
  before_action :signed_in_user,        only: [:edit, :update, :show]
  before_action :correct_user,          only: [:edit, :update]
  before_action :correct_user_or_admin, only: [:show]

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params())
    if @signup.save
      @user = @signup.customer
      sign_in @user

      flash[:success] = "Welcome to the Crappy-Book-Store.com!"
      redirect_to sti_user_path("Customer", @user)
    else
      render "new"
    end
  end

  def show
    @customer = Customer.find(params[:id])
    @addresses = @customer.addresses.paginate(page: params[:page])
  end

  def edit
    @user = Customer.find(params[:id])
    render "users/edit"
  end

  def update
    @user = Customer.find(params[:id])
    if @user.update_attributes(user_params())
      flash[:success] = "Profile updated"
      redirect_to sti_user_path("Customer", @user)
    else
      render "users/edit"
    end
  end

end
