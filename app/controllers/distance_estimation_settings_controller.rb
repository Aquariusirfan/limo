class DistanceEstimationSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_distance_estimation_setting , only: [:show,:edit,:update,:destroy]
  def edit
    
  end
  
  def update
    @setting.update_attributes(rate_group: params[:rate_group],up_to_mile: params[:up_to_mile],base_charge: params[:base_charge],cost_per_distance: params[:cost_per_distance],miles_per_distance: params[:miles_per_distance])
    @vehicle_type = @setting.vehicle_type
  end
  
  private
  def set_distance_estimation_setting
    @setting = DistanceEstimationSetting.find(params[:id])
  end
end
