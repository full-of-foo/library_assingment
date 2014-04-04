module PurchasesHelper

  def charge_customer(charging_customer, card_token, purchase)
    customer = Stripe::Customer
      .create(email: charging_customer.email, card: card_token)

    Stripe::Charge
      .create(customer: customer.id, amount: (purchase.total_cost * 100).to_i, currency: 'eur')
  end

end
