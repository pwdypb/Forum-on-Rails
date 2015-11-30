class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email.downcase! }

  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :email, presence: true, length: {maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false }
  validates :password, length: {minimum: 6}, presence: true

  has_secure_password

  has_and_belongs_to_many :topics
end
