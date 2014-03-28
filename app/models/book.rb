class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :topic

  validates :author,
            :topic, presence: true
  validates :title, presence: true, length: { minimum: 2 }

  generate_scopes


  def validate
    errors.add(:price, "should be at least 0.01") if price.nil? || price < 0.01

    super
  end

  def self.search(search)
    search ? joins(:author, :topic).where('lower(books.title) LIKE ? OR lower(authors.full_name) LIKE ?',
                                  "%#{search.downcase}%", "%#{search.downcase}%") : self.joins(:author, :topic)
  end
end

