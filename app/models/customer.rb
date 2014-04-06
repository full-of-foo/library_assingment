class Customer < User
  has_many :addresses
  has_many :purchases
  has_many :ratings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def self.model_name
    User.model_name
  end

end
