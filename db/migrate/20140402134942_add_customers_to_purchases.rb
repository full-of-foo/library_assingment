class AddCustomersToPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :customer_id
    add_column :purchases, :customer_id, :integer, index: true
  end
end
