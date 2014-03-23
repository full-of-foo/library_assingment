module AddressesHelper

  def address_params
    params.require(:address).permit(:line1, :line2, :city, :state, :zip,
                                  :country, :customer_id)
  end
end
