class Spot < ApplicationRecord
  has_many :fishes_spot
  has_many :user_spot
  belongs_to :region
  has_many :users, through: :user_spots
  has_many :fishes, through: :fishes_spot
end
