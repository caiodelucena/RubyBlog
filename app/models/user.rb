class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, uniqueness: { case_sensitive: false }, presence: true, length: { minimum: 3, maximum: 25 }
  validates :email, uniqueness: { case_sensitive: false }, presence: true, format: { with: VALID_EMAIL_REGEX}, length: { maximum: 105}
end