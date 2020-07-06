class Critter < ApplicationRecord
    has_many :user_critters
    has_many :users, through: :user_critters
end
