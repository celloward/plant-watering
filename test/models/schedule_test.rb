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
    assert_not Schedule.find_each { |record| to_date(record.date).saturday? || to_date(record.date).sunday? }
  end

  test "doesn't schedule any watering on Christmas and New Years" do
    assert_not Schedule.find_each { |record| to_date(record.date) == to_date("2019-12-25") || to_date(record.date) == to_date("2020-01-01") }
  end

  test "watering schedule varies no more than one day for each plant" do
  end

end
