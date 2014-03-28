class Topic < ActiveRecord::Base
  has_many :books

  validates :title, presence: true, length: { minimum: 2 }
end

