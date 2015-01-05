class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation , only: [:edit,:update,:destroy]

  def index
    @reservations = current_user.company.reservations
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "Reservations was successfully created."
      redirect_to reservations_path
    else
      render :new
    end
  end

  def edit
  end
 
  def update
    if @reservation.update_attributes(reservation_params)
      flash[:notice] = "Reservations was successfully updated."
      redirect_to reservations_path
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def reservation_params
    params[:reservation].permit!
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

end
