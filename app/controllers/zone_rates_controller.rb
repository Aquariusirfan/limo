class ZoneRatesController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.company.company_zones.size > 0
      @company_zone = current_user.company.company_zones.first
    end
  end
end
