class CreateSchedulings < ActiveRecord::Migration[5.2]
  def change
    create_table :schedulings do |t|
      t.references :plant, foreign_key: true
      t.references :schedule, foreign_key: true
      t.boolean :watered, default: false

      t.timestamps
    end
  end
end
