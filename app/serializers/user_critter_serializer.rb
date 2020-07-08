class UserCritterSerializer < ActiveModel::Serializer
   attributes :id, :critter

   belongs_to :critter
end
