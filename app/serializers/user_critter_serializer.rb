class UserCritterSerializer < ActiveModel::Serializer
  attributes :critter
  
  belongs_to :critter
end
