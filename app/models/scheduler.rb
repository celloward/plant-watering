include SchedulesHelper

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
  
  def avoid_weekends date
    if date.saturday?
      date -= 1
    elsif date.sunday?
      date += 1
    end
    date
  end

  def create_schedule
    (@start_date..@end_date).each { |current_date| Schedule.create!(date: current_date.to_s) }
  end

  def create_plants
    @info.each { |plant_record| Plant.create!(name: plant_record["name"], watering_frequency_in_days: plant_record["water_after"].split[0].to_i) }
  end
          
  def create_scheduling
    create_schedule
    create_plants
    Plant.find_each.each do |plant_record|
      current_date = @start_date
      until current_date > @end_date
        watering_date = Schedule.find_by(date: current_date )
        watering_date.plants << plant_record
        current_date += plant_record[:watering_frequency_in_days]
        current_date = avoid_weekends(current_date)
      end
    end
  end

end