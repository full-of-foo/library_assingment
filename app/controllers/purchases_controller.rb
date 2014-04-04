class PurchasesController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user_or_admin, only: [:index]

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
    if carted_books_in_stock?
      @purchase = Purchase.new(customer: current_user,
                               address_id: params[:address][:id])
      @purchase.save!
      shopping_cart.each do |book_id|
        book = Book.find(book_id)
        @purchase.books << book
        BookStock.decrement(book)
      end

      charge_customer(current_user, params[:stripeToken], @purchase)
    else
      flash[:warning] = "Oops! Purchase Cancelled! Books you carted are no longer stocked"
      redirect_to books_path
    end
    clear_cart!
  end

end
