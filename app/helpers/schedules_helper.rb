module SchedulesHelper

  def to_date date_string
    Date.strptime( date_string, "%Y-%m-%d")
  end

  def collect_months schedule
    schedule.all.find_each.collect { |r| to_date(r.date).month }.uniq
  end

  def records_in_month select_month
    Schedule.all.find_each.select { |r| to_date(r.date, "%Y-%m-%d").month == select_month  }
  end

end
