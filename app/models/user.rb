class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email.downcase! }

  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :email, presence: true, length: {maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false }
  validates :password, length: {minimum: 6}, presence: true

  has_secure_password

  has_and_belongs_to_many :topics
  has_many :posts
  
  Roles = [:admin, :default]
  
  def is?( requested_role )
    self.role == requested_role
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
