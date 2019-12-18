class Plant < ApplicationRecord

  has_many :schedulings
  has_many :schedules, through: :scheduling
end
