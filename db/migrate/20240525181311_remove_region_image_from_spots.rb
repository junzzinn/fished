class RemoveRegionImageFromSpots < ActiveRecord::Migration[7.1]
  def change
    remove_column :spots, :regionImage, :string
  end
end
