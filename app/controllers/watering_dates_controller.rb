class WateringDatesController < ApplicationController
  
  def index
    @watering_dates = WateringDate.all
  end

  def show
    @watering_date = WateringDate.find_by(date: Date.today.to_s)
  end
end
