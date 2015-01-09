class RateGroupsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
  end
  
  def create
#    puts 'xxxxxxxxxxxxxxxxxx' , params.inspect
#    ddd
    @rate_group = RateGroup.new(rate_group_params)
    if @rate_group.save
      flash[:notice] = "Rate Group was successfully created."
      redirect_to rate_groups_path
    else
      flash[:notice] = "Error."
    end
  end
  
  private
  
  def rate_group_params
    params.require(:rate_group).permit!
  end
  
end
