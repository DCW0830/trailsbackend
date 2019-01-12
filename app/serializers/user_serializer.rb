class UserSerializer < ActiveModel::Serializer
  has_many :trails
  attributes :id, :username
end
