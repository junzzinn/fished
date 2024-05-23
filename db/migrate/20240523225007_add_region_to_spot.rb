class AddRegionToSpot < ActiveRecord::Migration[7.1]
  def change
    add_reference :spots, :region, null: false, foreign_key: true
  end
end
