class CreateSpots < ActiveRecord::Migration[7.1]
  def change
    create_table :spots do |t|
      t.float :longitude
      t.float :latitude
      t.string :name
      t.string :region

      t.timestamps
    end
  end
end
