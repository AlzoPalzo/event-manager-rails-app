class CreateOcassionLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :ocassion_locations do |t|
      t.integer :ocassion_id
      t.integer :location_id

      t.timestamps
    end
  end
end
