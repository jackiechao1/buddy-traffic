class AddCoordinatesToBuddies < ActiveRecord::Migration[5.2]
  def change
    add_column :buddies, :latitude, :float
    add_column :buddies, :longitude, :float
  end
end
