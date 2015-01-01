class Admin::CompaniesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  
  def new
    @user = User.new
    @user.build_company
  end
  
  def create
    @user = User.new(company_params)
    if @user.save
      @user.add_role :company
      flash[:notice] = "Company is created successfully"
      redirect_to admin_path
    else
      flash[:notice] = "#{@user.errors.full_messages.join(',')}"
      redirect_to new_admin_company_path 
    end
  end
  
  private
  def company_params
    params.require(:user).permit(:email,:password,:password_confirmation,:company_attributes=>[:id,:name,:phone1,:phone2,:show_driver_price,:dot_number,:lcc_mc,:fax,:website,:address,:time_zone])
  end
end
