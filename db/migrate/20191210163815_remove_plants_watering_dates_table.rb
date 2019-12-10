class RemovePlantsWateringDatesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :plants_watering_dates
  end
end
