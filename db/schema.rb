# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_10_163815) do

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.integer "water_after_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedulings", force: :cascade do |t|
    t.integer "plant_id"
    t.integer "watering_date_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_schedulings_on_plant_id"
    t.index ["watering_date_id"], name: "index_schedulings_on_watering_date_id"
  end

  create_table "watering_dates", force: :cascade do |t|
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
