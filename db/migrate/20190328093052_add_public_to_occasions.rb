class AddPublicToOccasions < ActiveRecord::Migration[5.2]
  def change
    add_column :occasions, :public_event, :boolean
  end
end
