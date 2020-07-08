class Critter < ApplicationRecord
    has_many :user_critters, dependent: :destroy
    has_many :users, through: :user_critters
end
