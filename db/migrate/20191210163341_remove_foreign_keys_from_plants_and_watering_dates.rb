class RemoveForeignKeysFromPlantsAndWateringDates < ActiveRecord::Migration[5.2]
  def change
    remove_reference :plants, :schedule, index: true, foreign_key: true
    remove_reference :watering_dates, :plant, index: true, foreign_key: true
  end
end
