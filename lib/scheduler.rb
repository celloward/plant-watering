class Scheduler
attr_reader :info, :start_date, :end_date, :dates

#Start date requires format Year-Month-Day.
#JSON file requires a keys "name" and "water_after" for the enclosed hash.
  def initialize json_file, start_date, number_of_weeks
    json = File.open("#{json_file}", "r").read
    @info = JSON::load(json)
    @start_date = to_date(start_date)
    @end_date = @start_date + (number_of_weeks * 7)
  end

  def to_date date
    Date.strptime(date, "%Y-%m-%d")
  end

  def find_watering_dates plant_hash
    date = @start_date
    watering_date_array = []
    until date > @end_date
      watering_date_array << date
      date += plant_hash["water_after"].split[0].to_i
      date = avoid_weekends_and_holidays(date)
    end
    watering_date_array
  end
  
  def avoid_weekends_and_holidays date
    if date.saturday?
      date = date - 1
    elsif date.sunday? || 
      date == Date.strptime("12-25-2019", "%m-%d-%Y") || 
        date == Date.strptime("1-1-2020", "%m-%d-%Y")
          date = date + 1
    end
    date
  end
          
  def create_schedule
    schedule = (@start_date..@end_date).to_a.map { |schedule_date| { date: "#{schedule_date}", plants: [] } }
    @info.each do |plant_hash|
      watering_dates = find_watering_dates(plant_hash)
      schedule.map do |seed_date|
       seed_date[:plants] << plant_hash["name"] if watering_dates.include?(to_date(seed_date[:date])) 
      end
    end
    schedule
  end

end