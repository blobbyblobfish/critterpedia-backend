class User < ApplicationRecord
    has_many :user_critters
    has_many :critters, through: user_critters

    validates :username, uniqueness: true
    has_secure_password
end
