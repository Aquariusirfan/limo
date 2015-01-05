class ZipCodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_zip_code , only: [:destroy]
  def create
    @zip_code = ZipCode.new(zip_code_params)
    @zip_code.save
    @company_zone = @zip_code.company_zone
  end
  def destroy
    @company_zone = @zip_code.company_zone
    @zip_code.destroy
  end
  private
  def zip_code_params
    params.require(:zip_code).permit!
  end
  def set_zip_code
    @zip_code = ZipCode.find(params[:id])
  end
end
