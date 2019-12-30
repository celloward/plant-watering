class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :watering_frequency_in_days

      t.timestamps
    end
  end
end
