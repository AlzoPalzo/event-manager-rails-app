class CreateOccasionLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :occasion_locations do |t|
      t.integer :occasion_id
      t.integer :location_id

      t.timestamps
    end
  end
end
