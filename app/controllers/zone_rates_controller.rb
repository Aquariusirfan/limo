class ZoneRatesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.company.company_zones.size > 0
      @company_zone = current_user.company.company_zones.first
    end
  end
  
  def create
    #k == vehicle_type-id and v == zone_rate_value
    params[:hash].each do |k,v|
      zone_rate = ZoneRate.where(:vehicle_type_id=>k,:destination_id=>params[:destination_id],:source_id=>params[:source_id],:company_id=>current_user.company.id)
      if zone_rate.size > 0
        zone_rate.first.update_attribute(:zone_rate,v)
      else
        ZoneRate.create(:vehicle_type_id=>k,:zone_rate=>v,:destination_id=>params[:destination_id],:source_id=>params[:source_id],:company_id=>current_user.company.id)
      end
      
    end
  end
  #using this method in jQuery.
  def find_zone_rate
    zone_rates = ZoneRate.where(:destination_id=>params[:destination_id],:source_id=>params[:source_id],:company_id=>current_user.company.id)
    if zone_rates.size > 0
      render :json => {'status'=>'success','zone_rates'=>zone_rates}
    else
      render :json => {'status'=>"failure"}
    end
  end
  
  #Set is_active through jQuery
  
  def set_is_active
    zone_rate = ZoneRate.where(:vehicle_type_id=>params[:id],:destination_id=>params[:destination_id],:source_id=>params[:source_id],:company_id=>current_user.company.id)
    zone_rate.first.update_attribute(:is_active,params[:is_active])
    render :json=>{'status'=>"success"}
  end
end
