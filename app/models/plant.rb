class Plant < ApplicationRecord
  has_many :schedulings
  has_many :watering_dates, through: :schedulings
end
