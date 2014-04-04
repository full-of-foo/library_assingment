class BookStock < ActiveRecord::Base
  belongs_to :book

  validates :book, presence: true

  def self.decrement(book, amount = 1)
    if book.has_stock_amount?(amount)
      amount.times { BookStock.where(book: book).last.destroy }
    else
      false
    end
  end

end

