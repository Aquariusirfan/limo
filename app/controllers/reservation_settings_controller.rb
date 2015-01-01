class ReservationSettingsController < ApplicationController
  before_action :authenticate_user!

  def reservation_setting
    @reservation_setting = ReservationSetting.first
  end

  def update
    @reservation_setting = ReservationSetting.first
    if @reservation_setting.update_attributes(reservation_params).to_s
      flash[:notice] = "Reservation setting was successfully updated."
      redirect_to request.referrer
    else
      flash[:error] = "Reservation setting can't be updated. Please try again or later"
      redirect_to request.referrer
    end
  end

  private

  def reservation_params
    params[:reservation_setting].permit!
  end

end