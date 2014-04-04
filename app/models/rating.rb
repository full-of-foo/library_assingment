class Rating < ActiveRecord::Base
  belongs_to :book
  belongs_to :customer

  validates :amount,
            :book,
            :customer, presence: true

  def self.book_average(book)
    rating_amounts = book.ratings.map(&:amount).map(&:to_f)

    !rating_amounts.empty? ? (rating_amounts.sum / rating_amounts.size).round(1) : 0.0
  end

  def self.customer_book_rating(customer, book)
    where(customer: customer, book: book).first
  end

  def formated_amount
    amount.to_f.round(1)
  end

end

