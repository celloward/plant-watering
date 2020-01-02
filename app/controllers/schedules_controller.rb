class SchedulesController < ApplicationController
  
  def index
    @schedules = Schedule.includes(:plants)
    @todays_schedule = @schedules.today
    @plants_are_waterable = !@todays_schedule.plants.empty?
    @monthly_records = Hash.new
    @schedules.create_monthly_records(@monthly_records)
  end

  def show
    @schedule = Schedule.find(params[:id])
  end
end
