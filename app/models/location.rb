class Location < ApplicationRecord
  has_many :occasions

  geocoded_by :address
  after_validation :geocode



end
