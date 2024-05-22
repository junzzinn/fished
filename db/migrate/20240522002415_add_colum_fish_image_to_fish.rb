class AddColumFishImageToFish < ActiveRecord::Migration[7.1]
  def change
    add_column :fish, :fishImage, :string
  end
end
