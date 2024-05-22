class AddColumsImagesToSpot < ActiveRecord::Migration[7.1]
  def change
    add_column :spots, :spotImage, :string
    add_column :spots, :regionImage, :string
  end
end
