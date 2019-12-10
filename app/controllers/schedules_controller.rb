class SchedulesController < ApplicationController
  
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find_by(date: Date.today.to_s)
  end
end
