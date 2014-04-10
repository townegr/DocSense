class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to @schedule, notice: "Created schedule."
    else
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update_attributes(schedule_params)
      redirect_to @schedule, notice: "Updated schedule."
    else
      render :edit
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :encounter_date)
  end
end
