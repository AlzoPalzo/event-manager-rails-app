class User < ApplicationRecord
    has_many :user_occasions
    has_many :occasions, through: :user_occasions
    has_many :messages
    has_many :friends

    has_secure_password

    validates :name, presence: true, uniqueness: true
    validates :age,  numericality: {greater_than: 12, less_than: 124}
    validates :bio, length: {in: 10..500}
end
