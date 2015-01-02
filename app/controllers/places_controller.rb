class PlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place , only: [:show,:edit,:update,:destroy]

  def index
    @places = current_user.company.places
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      flash[:notice] = "Place was successfully created."
      redirect_to places_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @place.update_attributes(place_params)
      flash[:notice] = "Place was successfully updated."
      redirect_to places_path
    else
      render :edit
    end
  end

  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Places was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def place_params
    params[:place].permit!
  end
  
  def set_place
    @place = Place.find(params[:id])
  end

end
