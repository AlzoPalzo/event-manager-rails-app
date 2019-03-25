class User < ApplicationRecord
    has_many :user_occasions
    has_many :occasions, through: :user_occasions
    has_many :messages
end
