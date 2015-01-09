class RateGroupsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
  end
  
  def create
    puts 'xxxxxxxxxxxxxxxxxx' , params.inspect
    ddd
  end
  
  private
  
  def rate_group_params
    params.require(:rate_group).permit!
  end
  
end
