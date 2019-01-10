class UserSerializer < ActiveModel::Serializer
  has_many :trails
  attributes :username
end
