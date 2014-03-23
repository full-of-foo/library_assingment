class CreateAddressesTable < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country

      t.timestamps
    end

    add_column :addresses, :customer_id, :integer
    add_index :addresses, :customer_id
  end
end
