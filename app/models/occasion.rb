class Occasion < ApplicationRecord
    has_many :user_occasions
    has_many :users, through: :user_occasions
    has_many :messages
    belongs_to :location

    #accepts_nested_attributes_for :locations


    validates :name, presence: true, uniqueness: true, length:  { maximum: 70 }
    validates :date_time, date:
      { after: Proc.new { Time.now },
        before: Proc.new { Time.now + 1000.year }
      }
end
