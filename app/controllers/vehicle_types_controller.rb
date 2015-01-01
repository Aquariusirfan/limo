class VehicleTypesController < ApplicationController
  before_action :authenticate_user!

  def index
    @vehicle_types = VehicleType.all
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
    @vehicle_type = VehicleType.find(params[:id])
  end

  def update
    @vehicle_type = VehicleType.find(params[:id])
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

  private

  def vehicle_params
    params[:vehicle_type].permit!
  end

end
