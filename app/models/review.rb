class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :customer

  validates :message,
            :book,
            :customer, presence: true

  def self.customer_book_review(customer, book)
    where(customer: customer, book: book).first
  end

end

