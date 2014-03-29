class CreateBookStock < ActiveRecord::Migration
  def change
    create_table :book_stocks do |t|
      t.integer :book_id, index: true
    end
  end
end
