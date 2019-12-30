require 'scheduler'

Schedule.delete_all
Plant.delete_all

scheduler = Scheduler.new("db/Apprentice_WeGrowInTandem_Data.json", "2019-12-16", 12)
scheduler.create_scheduling