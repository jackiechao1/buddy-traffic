class CreateBuddies < ActiveRecord::Migration[5.2]
  def change
    create_table :buddies do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :location
      t.integer :age
      t.string :sex
      t.string :description
      t.string :picture
      t.date :start_available_time
      t.date :end_available_time
      t.string :picture

      t.timestamps
    end
  end
end
