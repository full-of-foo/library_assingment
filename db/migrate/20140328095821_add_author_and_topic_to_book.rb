class AddAuthorAndTopicToBook < ActiveRecord::Migration
  def change
    add_column :books, :author_id, :integer
    add_index :books, :author_id

    add_column :books, :topic_id, :integer
    add_index :books, :topic_id
  end
end
