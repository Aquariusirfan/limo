class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_schedule,only: [:edit,:update,:destroy]   
  
  def create
    Schedule.create(schedule_params)
  end
  
  def edit
    
  end
  
  def update
    @schedule.update_attributes(schedule_params)
  end
  
  def destroy
    @schedule.destroy
  end
  
  private
  
  def schedule_params
    params.require(:schedule).permit(:id,:schedule_type,:name,:start_time,:end_time,:monday,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday,:start_date,:end_date,:rate_group_id)
  end
  
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
