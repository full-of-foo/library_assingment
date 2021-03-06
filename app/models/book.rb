class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :topic
  has_many :book_stocks, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :author,
            :topic, presence: true
  validates :title, presence: true, length: { minimum: 2 }

  generate_scopes


  def validate
    errors.add(:price, "should be at least 0.01") if price.nil? || price < 0.01
    super
  end

  def stock_count
    BookStock.where(book: self).count
  end

  def has_stock_amount?(amount)
    stock_count >= amount
  end

  def average_rating
    Rating.book_average(self)
  end

  def customer_rating(customer)
    Rating.customer_book_rating(customer, self)
  end

  def self.search(search)
    search ? BooksWithStockCountQuery.new.select.joins(:author, :topic)
      .where('lower(books.title) LIKE ? OR lower(authors.full_name) LIKE ?',
               "%#{search.downcase}%", "%#{search.downcase}%") : BooksWithStockCountQuery.new.select.joins(:author, :topic)
  end
end

