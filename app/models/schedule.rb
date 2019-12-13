include SchedulesHelper

class Schedule < ApplicationRecord
  serialize :plants, JSON

  def self.today
    self.find_by(date: Date.today.to_s)
  end

  def self.collect_months
    self.find_each.collect { |r| to_date(r.date).month }.uniq
  end

  def self.records_in_month select_month
    self.find_each.select { |r| to_date(r.date).month == select_month  }
  end

end
