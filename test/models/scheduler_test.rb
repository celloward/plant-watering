require 'test_helper'
require 'scheduler'

class SchedulerTest < ActiveSupport::TestCase

  test "converts JSON file into array of hashes" do
    schedule = Scheduler.new("db/Apprentice_WeGrowInTandem_Data.json", "2019-12-16", 12)
    assert_equal schedule.info, [{"name"=>"Fiddle Leaf Fig", "water_after"=>"7 days"}, {"name"=>"Snake Plant", "water_after"=>"14 days"}, {"name"=>"Money Tree", "water_after"=>"14 days"}, {"name"=>"Bird's Nest Fern", "water_after"=>"3 days"}, {"name"=>"Croton", "water_after"=>"7 days"}, {"name"=>"Bell Pepper Plant", "water_after"=>"3 days"}, {"name"=>"Strawberry Plant", "water_after"=>"3 days"}, {"name"=>"Dracaena", "water_after"=>"14 days"}, {"name"=>"Spider Plant", "water_after"=>"7 days"}, {"name"=>"Jade", "water_after"=>"14 days"}, {"name"=>"Wavy Fern", "water_after"=>"2 days"}]
  end

end