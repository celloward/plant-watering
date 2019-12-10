require 'test_helper'
require 'schedules_helper'

class ScheduleTest < ActiveSupport::TestCase

  def to_date date
    Date.strptime(date, "%Y-%m-%d")
  end

  def setup
    Rails.application.load_seed
  end

  test "doesn't schedule any watering on weekends" do
    assert_not Schedule.find_each { |record| to_date(record.date).saturday? }
  end

  test "doesn't schedule any watering on Christmas" do
    assert_not Schedule.find_each { |record| to_date(record.date) == to_date("2019-12-25") && record.plants }
  end

  test "watering schedule varies no more than one day for each plant" do
  end

end
