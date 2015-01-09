class LocationRulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location_rule,only: [:edit,:update,:destroy]
  
  def index
    @location_rules = RateGroup.find(params[:group_rate_id]).location_rules
  end
  
    
  def create
    LocationRule.create(location_rule_params)
  end
  
  def edit
    
  end
  
  def update
    @location_rule.update_attributes(location_rule_params)
  end
  
  def destroy
    @location_rule.destroy
  end
  
  private
  
  def location_rule_params
    params.require(:location_rule).permit!
  end
  
  def set_location_rule
    @location_rule = LocationRule.find(params[:id])
  end
end
