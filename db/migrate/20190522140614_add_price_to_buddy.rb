class AddPriceToBuddy < ActiveRecord::Migration[5.2]
  def change
    add_column :buddies, :price, :integer
  end
end
