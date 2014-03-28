class CreateBook < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, index: true
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
