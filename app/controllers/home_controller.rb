class HomeController < ApplicationController
  before_action :check_if_admin_is_login?
  
  def index
    
  end
end
