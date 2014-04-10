class CustomersController < ApplicationController

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(permitted_params.signup)
    if @signup.save
      @user = @signup.customer
      Session.new(@user, cookies).sign_in

      flash[:success] = "Welcome to the Crappy-Book-Store.com!"
      redirect_to sti_user_path("Customer", @user)
    else
      render "new"
    end
  end

  def show
    @customer  = Customer.find(params[:id])
    @addresses = @customer.addresses.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @user = Customer.find(params[:id])
    render "users/edit"
  end

  def update
    @user = Customer.find(params[:id])
    if @user.update_attributes(permitted_params.user)
      flash[:success] = "Profile updated"
      redirect_to sti_user_path("Customer", @user)
    else
      render "users/edit"
    end
  end

end
