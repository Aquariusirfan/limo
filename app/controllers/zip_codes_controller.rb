class ZipCodesController < ApplicationController
  def create
    @zip_code = ZipCode.new(zip_code_params)
    @zip_code.save
    @company_zone = @zip_code.company_zone
  end
  private
  def zip_code_params
    params.require(:zip_code).permit!
  end
end
