class WateringDate < ApplicationRecord
  has_many :schedulings
  has_many :plants, through: :schedulings
end
