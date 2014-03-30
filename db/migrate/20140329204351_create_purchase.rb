class CreatePurchase < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :customer_id, index: true

      t.timestamps
    end
  end
end
