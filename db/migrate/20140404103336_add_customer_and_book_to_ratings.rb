class AddCustomerAndBookToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :customer_id, :integer
    add_index :ratings,  :customer_id
    add_column :ratings, :book_id, :integer
    add_index :ratings,  :book_id
  end
end
