class CreateFish < ActiveRecord::Migration[7.1]
  def change
    create_table :fish do |t|
      t.string :name

      t.timestamps
    end
  end
end
