class RemoveRegionFromSpot < ActiveRecord::Migration[7.1]
  def change
    remove_column :spots, :region, :string
  end
end
