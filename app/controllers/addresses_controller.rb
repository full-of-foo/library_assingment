class AddressesController < ApplicationController
  before_action :signed_in_user
  before_action :correct_address_customer
  before_action :find_customer

  def new
    @address = current_user.addresses.build
  end

  def create
    @address = current_user.addresses.build(permitted_params.address)

    if @address.save
      flash[:success] = "Address created"
      redirect_to sti_user_path("Customer", @customer)
    else
      render "addresses/new"
    end
  end

  def edit
    @address = Address.find_by(id: params[:id], customer_id: params[:customer_id])
  end

  def update
    @address = Address.find_by(id: params[:id], customer_id: params[:customer_id])

    if @address.update_attributes(permitted_params.address)
      flash[:success] = "Address updated"
      redirect_to sti_user_path("Customer", @customer)
    else
      render "addresses/edit"
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    flash[:success] = "Address deleted"
    redirect_to sti_user_path("Customer", @customer)
  end


  private

    def find_customer
      @customer ||= Customer.find(params[:customer_id])
    end

end
