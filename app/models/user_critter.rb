class UserCritter < ApplicationRecord
  belongs_to :user
  belongs_to :critter
end
