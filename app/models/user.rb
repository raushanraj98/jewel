class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence:true,uniqueness: { case_sensitive: false }, 
              length: { maximum: 105 },
              format: { with: VALID_EMAIL_REGEX }
  validates:password, presence: true
end
