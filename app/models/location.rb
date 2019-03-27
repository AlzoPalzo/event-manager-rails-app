class Location < ApplicationRecord
    has_many :occasion_locations
    has_many :occasion, through: :occasion_locations


    def star_rating
        star_rating = ""
        #self.rating.times do
        5.times do
             star_rating << "\u2605".encode('utf-8')
        end
        star_rating
    end
end
