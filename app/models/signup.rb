class Signup
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :customer
  attr_accessor :address

  attribute :first_name, String
  attribute :surname, String
  attribute :email, String
  attribute :password, String

  attribute :line1, String
  attribute :line2, String
  attribute :city, String
  attribute :state, String
  attribute :zip, String
  attribute :country, String

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :surname, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validate :email_is_unique
  validates :password, length: { minimum: 6 }
  validates_confirmation_of :password, if: lambda { |m| m.password.present? }
  validates_presence_of     :password, :on => :create
  validates_presence_of     :password_confirmation, if: lambda { |m| m.password.present? }

  validates :line1,
            :city,
            :state,
            :country, presence: true, length: { minimum: 2 }
  validates :zip, length: { minimum: 2 }, :if => Proc.new {|a| !a.zip.blank? }
  validates :line2, length: { minimum: 2 }, :if => Proc.new {|a| !a.line2.blank? }

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

private

  def email_is_unique
      unless User.where(email: email).count == 0
        errors.add(:email, 'is already taken')
      end
    end

  def persist!
    @customer = Customer.create!(first_name: first_name,
                                 surname: surname,
                                 email: email,
                                 password: password,
                                 password_confirmation: password)

    @address = @customer.addresses.create!(line1: line1,
                                           line2: line2,
                                           city: city,
                                           state: state,
                                           zip: zip,
                                           country: country)
  end
end
