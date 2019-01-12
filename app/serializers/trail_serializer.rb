class TrailSerializer < ActiveModel::Serializer
  has_many :users
  attributes :id, :trail_number
end
