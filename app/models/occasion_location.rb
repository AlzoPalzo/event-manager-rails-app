class OcassionLocation < ApplicationRecord
    belongs_to :occasion
    belongs_to :occasion_location
end
