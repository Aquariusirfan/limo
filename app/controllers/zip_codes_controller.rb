class ZipCodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_zip_code , only: [:destroy,:re_assign_company_zone]
  
  def create
    @zip_code = ZipCode.new(zip_code_params)
    @zip_code.save
    @company_zone = CompanyZone.find(params[:company_zone_id])
    ZipZone.create(:zip_code_id=>@zip_code.id,:company_zone_id=>@company_zone.id)
  end
  
  def re_assign_company_zone
    @company_zone = CompanyZone.find(params[:company_zone_id])
    ZipZone.create(:zip_code_id=>@zip_code.id,:company_zone_id=>@company_zone.id)
  end
  
  def destroy
    @company_zone = CompanyZone.find(params[:company_zone_id])
    ZipZone.where(:company_zone_id=>params[:company_zone_id],:zip_code_id=>params[:id]).first.destroy
  end
  
  private
  
  def zip_code_params
    params.require(:zip_code).permit(:zcode)
  end

  def set_zip_code
    @zip_code = ZipCode.find(params[:id])
  end
end
