class VehicleTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vehicle , only: [:show,:edit,:update,:destroy,:update_base_transfer_distance,:add_distance_estimation_settings,:update_hourly_minimum,:add_hourly_estimation_settings]

  def index
    @vehicle_types = current_user.company.vehicle_types
  end
  
  def show
    
  end

  def new
    @vehicle_type = VehicleType.new
  end

  def create
    @vehicle_type = VehicleType.new(vehicle_params)
    if @vehicle_type.save
      flash[:notice] = "Vehicle Type was successfully created."
      redirect_to vehicle_types_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @vehicle_type.update_attributes(vehicle_params)
      flash[:notice] = "Vehicle Type was successfully updated."
      redirect_to vehicle_types_path
    else
      render :edit
    end
  end

  def destroy
    @vehicle_type.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_types_url, notice: 'Vehicle Type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def get_base_transfer_distance
    
  end
  
  def update_base_transfer_distance
    @vehicle_type.update_attribute(:base_transfer_distance,params[:base_transfer_distance])
  end
  
  def get_hourly_minmum
    
  end
  
  def update_hourly_minimum
     @vehicle_type.update_attribute(:hourly_minimum,params[:hourly_minimum])
  end
  
  def add_distance_estimation_settings
    DistanceEstimationSetting.create(rate_group: params[:rate_group],up_to_mile: params[:up_to_mile],base_charge: params[:base_charge],cost_per_distance: params[:cost_per_distance],miles_per_distance: params[:miles_per_distance],vehicle_type_id: @vehicle_type.id,company_id: @vehicle_type.company.id)
  end
  
  def add_hourly_estimation_settings
    HourlyEstimationSetting.create(rate_group: params[:rate_group],up_to_hours: params[:up_to_hours],service: params[:service],hourly_rate: params[:hourly_rate],vehicle_type_id: @vehicle_type.id,company_id: @vehicle_type.company.id)
  end
  

  private

  def vehicle_params
    params[:vehicle_type].permit!
  end
  
  def set_vehicle
    @vehicle_type = VehicleType.find(params[:id])
  end

end
