class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
    def after_sign_in_path_for(resource)
      if resource.has_role? :admin
        admin_url(:subdomain => resource.company.company_domain)
      else
        root_url(:subdomain => resource.company.company_domain)
      end
    end
  
    def check_if_admin_is_login?
      if current_user and current_user.has_role? :admin
        redirect_to admin_path
      end
    end
    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update)  { |u| u.permit(:email,
                                     :company_attributes=>[:id,:name,:phone1,:phone2,
                                     :show_driver_price,:dot_number,:lcc_mc,:fax,
                                     :website,:address,:time_zone]) }
    end
  end
