class PurchasesController < ApplicationController

  def index
    @purchases = Customer.find(params[:customer_id]).purchases
      .paginate(page: params[:page], per_page: 5)
  end

  def new
    if !shopping_cart.empty?
      @purchase  = Purchase.new
      @addresses = current_user.addresses
    else
      flash[:warning] = "Shopping cart is empty"
      redirect_to books_path
    end
  end

  def create
    purchaseCharger = PurchaseCharger.new(current_user, shopping_cart, params)

    if carted_books_in_stock? && purchaseCharger.save
      clear_cart!
      @purchase = purchaseCharger.purchase
    else
      clear_cart!
      flash[:warning] = "Oops! Purchase Cancelled! Books you carted are no longer stocked"
      redirect_to books_path
    end
  end

end
