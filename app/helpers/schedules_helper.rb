module SchedulesHelper

  def to_date date_string
    Date.strptime( date_string, "%Y-%m-%d")
  end

  def collect_months schedule
    schedule.all.find_each.collect { |r| to_date(r.date).month }.uniq
  end

  def records_in_month select_month
    Schedule.all.find_each.select { |r| to_date(r.date).month == select_month  }
  end

  def days_from_monday select_date
    date_num = to_date(select_date) .wday - 1
    date_num < 0 ? date_num = 6 : date_num
  end

  def print_date date_string
    real_date = to_date(date_string)
    "#{Date::MONTHNAMES[real_date.month]} #{real_date.day}, #{real_date.year}"
  end
end
