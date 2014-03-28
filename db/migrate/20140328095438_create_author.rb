class CreateAuthor < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :full_name
    end
  end
end
