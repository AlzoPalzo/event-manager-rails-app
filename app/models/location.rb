class Location < ApplicationRecord
    has_many :occasion_locations
    has_many :occasion, through: :occasion_locations
end
