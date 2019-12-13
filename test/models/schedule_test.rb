require 'test_helper'
require 'schedules_helper'
include SchedulesHelper

class ScheduleTest < ActiveSupport::TestCase

  def setup
    Rails.application.load_seed
  end

  test "schedules proper plants on desired date" do
    assert_equal Schedule.find_by(date: "2019-12-19")[:plants], ["Bird's Nest Fern", "Bell Pepper Plant", "Strawberry Plant"]
    assert_equal Schedule.find_by(date: "2019-12-18")[:plants], ["Wavy Fern"]
    assert_equal Schedule.find_by(date: "2019-12-17")[:plants], []
  end

  test "doesn't schedule any watering on weekends" do
    weekends = Schedule.find_each.select { |record| 
      to_date(record.date).saturday? || to_date(record.date).sunday? }
    assert_not weekends.empty?
    assert weekends.all? { |record| record.plants.empty? }
  end

end
