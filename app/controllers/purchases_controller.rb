class PurchasesController < ApplicationController
  before_action :signed_in_user

  def new
    if !shopping_cart.empty?
      @purchase = Purchase.new
    else
      flash[:warning] = "Shopping cart is empty"
      redirect_to books_path
    end
  end

  def create
    @purchase = Purchase.new(customer: current_user)
    @purchase.save!

    shopping_cart.each do |book_id|
      @purchase.books << Book.find(book_id)
    end
    clear_cart!

    customer = Stripe::Customer
      .create(email: current_user.email, card: params[:stripeToken])
    charge = Stripe::Charge
      .create(customer: customer.id, amount: (@purchase.total_cost * 100).to_i, currency: 'eur')
    rescue Stripe::CardError => e
      clear_cart!
      flash[:warning] = e.message
      redirect_to books_path
  end

end
