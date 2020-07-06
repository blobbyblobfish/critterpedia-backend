class UserCritterSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :critter
end
