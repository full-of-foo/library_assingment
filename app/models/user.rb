class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :surname, presence: true, length: { maximum: 30 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
     uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  def full_name
    self.first_name + " " + self.surname
  end

  protected

    def create_remember_token
      self.remember_token = ApplicationController.helpers
        .hash_token(ApplicationController.helpers.base64_remember_token())
    end
end
