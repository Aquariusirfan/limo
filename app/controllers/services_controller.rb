class ServicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @services = Service.all
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
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(service_params)
      flash[:notice] = "Service was successfully updated."
      redirect_to services_path
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
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
  
end
