class AddAcceptedToFriends < ActiveRecord::Migration[5.2]
  def change
    add_column :friends, :accepted, :boolean, default: false
  end
end
