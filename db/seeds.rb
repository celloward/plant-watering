require 'scheduler'

Schedule.delete_all

seed_data = Scheduler.new("db/Apprentice_WeGrowInTandem_Data.json", "2019-12-16", 12).create_schedule

seed_data.each do |hash|
  Schedule.create!(hash)
end