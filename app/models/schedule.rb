include SchedulesHelper

class Schedule < ApplicationRecord
  
  has_many :schedulings
  has_many :plants, through: :schedulings

  def self.today
    self.find_by(date: Date.today.to_s)
  end

  def self.collect_months
    self.find_each.collect { |r| to_date(r.date).month }.uniq
  end

  def self.records_in_month select_month
    self.find_each.select { |r| to_date(r.date).month == select_month  }
  end

  def self.create_monthly_records hash_shell
    self.collect_months.map { |month| hash_shell[month] = self.records_in_month(month) }
    hash_shell
  end

end
