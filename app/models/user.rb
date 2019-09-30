class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true
  validates :password, length: { in: 8..32 }
  validates :password, format: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
　validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
