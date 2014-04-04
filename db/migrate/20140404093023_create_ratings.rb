class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.decimal :amount

      t.timestamps
    end
  end
end
