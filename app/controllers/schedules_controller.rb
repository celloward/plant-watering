class SchedulesController < ApplicationController
  
  def index
    @schdules = Schedule.all
  end

  def show
    @schedule = Schedule.find(date: Date.today.to_s)
  end
end
