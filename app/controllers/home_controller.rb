class HomeController < ApplicationController
  #before_action :check_domain
  before_action :authenticate_user!
  before_action :check_if_admin_is_login?
  
  def index
    
  end
  
  
  def check_domain
    Company.where(:company_domain => request.subdomain).first || not_found
  end
  def not_found
    raise ActionController::RoutingError.new('Domain Not Found')
  end
end
