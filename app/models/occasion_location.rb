class OccasionLocation < ApplicationRecord
    belongs_to :occasion
    belongs_to :location
end
