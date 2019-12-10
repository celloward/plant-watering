def create_schedule watering_dates, start_date, end_date
    schedule = []
    (start_date..end_date).map do |current_date|
      plants_array = []
      watering_dates.each do |plant_hash|
        plants_array << plant_hash["name"] if plant_hash["water_on"].include?(current_date)
      end
      unless plants_array.empty?
        schedule << { date: "#{current_date}", plants: plants_array }
      end
    end
    schedule
  end
  
  def find_dates plant_info, days_after, start_date, end_date
      date = start_date
      date_array = []
      until date > end_date
        date_array << date
        date += plant_info[days_after].split[0].to_i
        date = avoid_weekends(date)
      end
      date_array
  end
  
  def avoid_weekends date
    case
    when date.saturday?
      date = date - 1
    when date.sunday?
      date = date + 1
    when date == Date.strptime("12-25-2019", "%m-%d-%Y")
      date = date + 1
    when date == Date.strptime("1-1-2020", "%m-%d-%Y")
      date = date + 1
    end
    date
  end

Schedule.delete_all

watering_json = File.open("db/Apprentice_WeGrowInTandem_Data.json", "r").read
watering_record = JSON::load(watering_json)
begin_date = Date.strptime("12-16-2019", "%m-%d-%Y")
finish_date = begin_date + 84

watering_dates = watering_record.map { |plant_record| plant_record.merge({ "water_on" => (find_dates(plant_record, "water_after", begin_date, finish_date)) }) }
schedule = Schedule.create!([create_schedule(watering_dates, begin_date, finish_date)])


