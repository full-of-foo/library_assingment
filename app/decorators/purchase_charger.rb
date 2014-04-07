class PurchaseCharger

  def initialize(customer, cart, params)
    @customer = customer
    @cart     = cart
    @params   = params
    @purchase = Purchase.new(customer: @customer,
                             address_id: @params[:address][:id])
  end

  def purchase
    @purchase
  end

  def save
    if @purchase.save
      decrement_stock
      charge_customer
    else
      false
    end
  end


private

  def decrement_stock
    @cart.each do |book_id|
        book = Book.find(book_id)
        @purchase.books << book
        BookStock.decrement(book)
    end
  end

  def charge_customer
    stripe_customer = Stripe::Customer
      .create(email: @customer.email, card: @params[:stripeToken])

    Stripe::Charge
      .create(customer: stripe_customer.id, amount: (@purchase.total_cost * 100).to_i, currency: 'eur')
  end

end
