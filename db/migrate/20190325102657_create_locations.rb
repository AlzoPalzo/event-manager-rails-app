class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :rating
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
