class Author < ActiveRecord::Base
  has_many :books

  validates :full_name, presence: true, length: { minimum: 5 }
end

