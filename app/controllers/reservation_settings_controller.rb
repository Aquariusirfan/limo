class ReservationSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation_setting, only: [:show,:edit,:update,:destroy]

  def edit
    
  end

  def update
    if @reservation_setting.update_attributes(reservation_params)
      flash[:notice] = "Reservation setting was successfully updated."
      redirect_to request.referrer
    else
      flash[:error] = "Reservation setting can't be updated. Please try again or later"
      redirect_to request.referrer
    end
  end

  private

  def set_reservation_setting
    @reservation_setting = ReservationSetting.find(params[:id])
  end
  
  def reservation_params
    params[:reservation_setting].permit!
  end

end