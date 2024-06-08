class AddDetailsToFish < ActiveRecord::Migration[7.1]
  def change
    add_column :fish, :bait, :string
    add_column :fish, :stick, :string
    add_column :fish, :clue, :string
    add_column :fish, :hour, :string
  end
end
