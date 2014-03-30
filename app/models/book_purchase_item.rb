class BookPurchaseItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :purchase

  validates :book,
            :purchase, presence: true
end

