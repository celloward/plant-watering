class WateringDate < ApplicationRecord
  # serialize :plants, JSON
  has_many :schedulings
  has_many :plants, through: :schedulings
end
