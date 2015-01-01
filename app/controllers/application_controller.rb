class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    if resource.has_role? :admin
      "/admin"
    else
      root_url(:subdomain => resource.company.company_domain)
    end
  end
  def check_if_admin_is_login?
    if current_user and current_user.has_role? :admin
      redirect_to admin_path
    end
  end
end
