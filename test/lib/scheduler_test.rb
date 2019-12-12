require 'test_helper'
require 'scheduler'

class SchedulerTest < ActiveSupport::TestCase
  
  setup do
    
  end

  test "@dates is in hash form" do
    schedule = Scheduler.new("db/Apprentice_WeGrowInTandem_Data.json", "2019-12-16", 12)
    assert_equal schedule.dates[2], { date: "2019-12-18", plants: []}
  end

  test "converts JSON file into array of hashes" do
    schedule = Scheduler.new("db/Apprentice_WeGrowInTandem_Data.json", "2019-12-16", 12)
    assert_equal schedule.info, [{"name"=>"Fiddle Leaf Fig", "water_after"=>"7 days"}, {"name"=>"Snake Plant", "water_after"=>"14 days"}, {"name"=>"Money Tree", "water_after"=>"14 days"}, {"name"=>"Bird's Nest Fern", "water_after"=>"3 days"}, {"name"=>"Croton", "water_after"=>"7 days"}, {"name"=>"Bell Pepper Plant", "water_after"=>"3 days"}, {"name"=>"Strawberry Plant", "water_after"=>"3 days"}, {"name"=>"Dracaena", "water_after"=>"14 days"}, {"name"=>"Spider Plant", "water_after"=>"7 days"}, {"name"=>"Jade", "water_after"=>"14 days"}, {"name"=>"Wavy Fern", "water_after"=>"2 days"}]
  end

  test "converts info into seed dates array" do
    schedule = Scheduler.new("db/Apprentice_WeGrowInTandem_Data.json", "2019-12-16", 12)
    seed_data = schedule.create_schedule
    assert_equal seed_data[3], {:date=>"2019-12-19", :plants=>["Bird's Nest Fern", "Bell Pepper Plant", "Strawberry Plant"]}
    assert_equal seed_data.last, {:date=>"2020-03-09", :plants=>["Fiddle Leaf Fig", "Snake Plant", "Money Tree", "Bird's Nest Fern", "Croton", "Bell Pepper Plant", "Strawberry Plant", "Dracaena", "Spider Plant", "Jade", "Wavy Fern"]}
  end
end