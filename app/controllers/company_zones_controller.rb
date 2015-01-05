class CompanyZonesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company_zone , only: [:show,:destroy]
  def show
    
  end
  
  def create
    @company_zone = CompanyZone.new(company_zone_params)
    @company_zone.save
  end
  def destroy
    @company_zone.destroy
    @company_zone = current_user.company.company_zones.first
  end
  private
  def company_zone_params
    params.require(:company_zone).permit!
  end
  
  def set_company_zone
    @company_zone = CompanyZone.find(params[:id])
  end
end
