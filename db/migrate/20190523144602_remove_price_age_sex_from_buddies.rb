class RemovePriceAgeSexFromBuddies < ActiveRecord::Migration[5.2]
  def change
    remove_column :buddies, :price, :integer
    remove_column :buddies, :age, :integer
    remove_column :buddies, :sex, :string
  end
end
