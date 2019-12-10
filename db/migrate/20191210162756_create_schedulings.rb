class CreateSchedulings < ActiveRecord::Migration[5.2]
  def change
    create_table :schedulings do |t|
      t.references :plant, foreign_key: true
      t.references :watering_date, foreing_key: true
      t.timestamps
    end
  end
end
