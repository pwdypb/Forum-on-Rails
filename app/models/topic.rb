class Topic < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :posts

  validates :title, presence: true, length: {minimum: 5, maximum: 50}
end
