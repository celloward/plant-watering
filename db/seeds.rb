  def find_dates plant_hash, hash_key, start_date, end_date
      date = start_date
      date_array = []
      until date > end_date
        date_array << date
        date += plant_hash[hash_key].split[0].to_i
        date = avoid_weekends_and_holidays(date)
      end
      date_array
  end
  
  def avoid_weekends_and_holidays date
    if date.saturday?
      date = date - 1
    elsif date.sunday? || date == Date.strptime("12-25-2019", "%m-%d-%Y") || date == Date.strptime("1-1-2020", "%m-%d-%Y")
          date = date + 1
    end
    date
  end

#Reset Database
WateringDate.delete_all
Plant.delete_all

#Parse JSON data
watering_json = File.open("db/Apprentice_WeGrowInTandem_Data.json", "r").read
watering_record = JSON::load(watering_json)

#Set time frame for schedule
start_date = Date.strptime("12-16-2019", "%m-%d-%Y")
end_date = start_date + 84

#Seed Plant Table
watering_record.each { |hash| Plant.create!({ name: hash["name"], water_after_days: hash["water_after"].split[0].to_i }) }

#Seed dates in WateringDate Table
schedule = (start_date..end_date).each { |current_date| WateringDate.create!({ date: current_date }) }

#Create array with all relevant info
watering_dates_array = watering_record.map { |plant_hash| plant_hash.merge({ "water_on" => (find_dates(plant_hash, "water_after", start_date, end_date)) }) }

#Join Plant and WateringDate Data
WateringDate.find_each do |current_date|
  watering_dates_array.each do |plant_hash|
    if plant_hash["water_on"].include?(Date.strptime("#{current_date.date}", "%Y-%m-%d"))
      current_date.plants << Plant.find_by(name: "#{plant_hash["name"]}")
    end
  end
end

    


