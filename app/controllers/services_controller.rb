class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service , only: [:edit,:update,:destroy]

  def index
    @services = current_user.company.services
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      flash[:notice] = "Service was successfully created."
      redirect_to services_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @service.update_attributes(service_params)
      flash[:notice] = "Service was successfully updated."
      redirect_to services_path
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Services was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def service_params
    params[:service].permit!
  end

  def set_service
    @service = Service.find(params[:id])
  end
  
end
