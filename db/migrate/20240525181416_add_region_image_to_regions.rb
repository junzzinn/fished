class AddRegionImageToRegions < ActiveRecord::Migration[7.1]
  def change
    add_column :regions, :regionImage, :string
  end
end
