class Customer < User
  has_many :addresses, dependent: :destroy
  has_many :purchases
  has_many :ratings, dependent: :destroy

  # validate at least address

  def self.model_name
    User.model_name
  end

end
