class User < ApplicationRecord
    has_many :user_critters, dependent: :destroy
    has_many :critters, through: :user_critters

    validates :username, uniqueness: true
    has_secure_password
end
