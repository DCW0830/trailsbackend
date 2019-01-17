class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, :case_sensitive => false

  has_secure_password
  has_many :user_trails
  has_many :trails, through: :user_trails
end
