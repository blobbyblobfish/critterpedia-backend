class User < ApplicationRecord
    has_many :user_critters
    has_many :critters, through: user_critters

    has_secure_password

    validates :username, uniqueness: true
end
