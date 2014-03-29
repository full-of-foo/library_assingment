class BookStock < ActiveRecord::Base
  belongs_to :book

  validates :book, presence: true
end

