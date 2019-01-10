class TrailSerializer < ActiveModel::Serializer
  has_many :users
  attributes :trail_number
end
