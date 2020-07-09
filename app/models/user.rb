class User < ApplicationRecord
    has_many :user_critters, dependent: :destroy
    has_many :critters, through: :user_critters

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :hemisphere, presence: true
    validates :password, presence: true
    has_secure_password
end
