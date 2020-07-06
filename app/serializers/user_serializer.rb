class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :hemisphere

  has_many :user_critters
end
