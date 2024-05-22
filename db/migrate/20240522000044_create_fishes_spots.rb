class CreateFishesSpots < ActiveRecord::Migration[7.1]
  def change
    create_table :fishes_spots do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :fish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
