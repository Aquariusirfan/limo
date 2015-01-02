class HourlyEstimationSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hourly_estimation_setting , only: [:show,:edit,:update,:destroy]
  def edit
    
  end
  
  def update
    @setting.update_attributes(rate_group: params[:rate_group],up_to_hours: params[:up_to_hours],service: params[:service],hourly_rate: params[:hourly_rate])
    @vehicle_type = @setting.vehicle_type
  end
  
  def destroy
    @vehicle_type = @setting.vehicle_type
    @setting.destroy
  end
  
  private
  def set_hourly_estimation_setting
    @setting = HourlyEstimationSetting.find(params[:id])
  end
end
