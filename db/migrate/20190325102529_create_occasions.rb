class CreateOccasions < ActiveRecord::Migration[5.2]
  def change
    create_table :occasions do |t|
      t.string :name
      t.integer :user_id
      t.datetime :date_time
      t.string :description

      t.timestamps
    end
  end
end
