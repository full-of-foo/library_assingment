class CreateBookPurchaseItem < ActiveRecord::Migration
  def change
    create_table :book_purchase_items do |t|
      t.integer :purchase_id, index: true
      t.integer :book_id, index: true
    end
  end
end
