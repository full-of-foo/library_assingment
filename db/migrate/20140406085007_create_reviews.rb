class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :message

      t.timestamps
    end

    add_column :reviews, :customer_id, :integer
    add_index :reviews,  :customer_id
    add_column :reviews, :book_id, :integer
    add_index :reviews,  :book_id
  end
end
