class Scheduling < ApplicationRecord
  belongs_to :plant, optional: true
  belongs_to :watering_date, optional: true
end
