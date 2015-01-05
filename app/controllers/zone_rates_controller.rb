class ZoneRatesController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.company.company_zones.size > 0
      @company_zone = current_user.company.company_zones.first
    end
  end
  def create
    params[:hash].each do |k,v|
      ZoneRate.create(:vehicle_type_id=>k,:zone_rate=>v,:destination_id=>params[:destination_id],:source_id=>params[:source_id])
    end
  end
end
