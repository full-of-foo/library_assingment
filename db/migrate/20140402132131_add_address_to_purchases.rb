class AddAddressToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :address_id, :integer, index: true
  end
end
