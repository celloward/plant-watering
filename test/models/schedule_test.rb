require 'test_helper'
require 'schedules_helper'

class ScheduleTest < ActiveSupport::TestCase

  def setup
    Rails.application.load_seed
  end

  test "schedules proper plants on desired date" do
    assert_equal Schedule.find_by(date: "2019-12-19")[:plants], ["Bird's Nest Fern", "Bell Pepper Plant", "Strawberry Plant"]
  end

  test "doesn't schedule any watering on weekends" do
    Schedule.find_each { |record| Date.strptime("#{(record.date)}", "%Y-%m-%d").saturday? }
  end

  test "doesn't schedule any watering on Christmas" do
    assert Schedule.find_by(date: "2019-12-25")[:plants].empty?
  end

end
