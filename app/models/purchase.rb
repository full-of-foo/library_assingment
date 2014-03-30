class Purchase < ActiveRecord::Base
  belongs_to :customer
  has_many :book_purchase_items
  has_many :books, through: :book_purchase_items

  validates :customer, presence: true

  def total_cost
    book_ids = book_purchase_items.map(&:book_id)

    Book.id_in(book_ids).to_a.each do |book|
      quantity   = book_ids.select {|id| id == book.id}.size
      book.price = book.price * quantity
    end.map(&:price).sum
  end
end

