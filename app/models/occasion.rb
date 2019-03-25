class Occasion < ApplicationRecord
    has_many :user_occasions
    has_many :users, through: :user_occasions
    has_many :messages
    has_many :occasion_locations
    has_many :locations, through: :occasion_locations
end
