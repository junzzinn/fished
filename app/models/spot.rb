class Spot < ApplicationRecord
  has_many :fishes_spot
  has_many :user_spot
  belongs_to :region
end
