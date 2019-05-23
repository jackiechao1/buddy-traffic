class AddSkillsToBuddies < ActiveRecord::Migration[5.2]
  def change
    add_column :buddies, :skills, :string, array: true, default: []
  end
end
