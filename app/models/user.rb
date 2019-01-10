class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :user_trails
  has_many :trails, through: :user_trails
end
