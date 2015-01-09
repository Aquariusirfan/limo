Rails.application.routes.draw do
  #devise_for :users, :controllers => { :invitations => 'devise/invitations' }
  
  devise_for :users
  as :user do
    get '/affiliates/invitation/new' => 'affiliate/invitations#new', :as => :new_affiliate_invitation
    post '/affiliates/invitation' => 'affiliate/invitations#create', :as => :affiliate_invitation
  end
  
  root to: 'home#index'
  
  get '/admin' => "admin/dashboard#index"
  
  namespace :admin do
    resources :companies 
  end
  
  resources :vehicle_types do
    collection do
      get :get_base_transfer_distance
      post :update_base_transfer_distance
      post :add_distance_estimation_settings
      post :add_hourly_estimation_settings
      get :get_hourly_minimum
      post :update_hourly_minimum
    end
  end
  resources :reservation_settings 
  resources :rate_setups , only: :index 
  resources :distance_estimation_settings , only: [:edit,:update,:destroy] 
  resources :hourly_estimation_settings , only: [:edit,:update,:destroy] 
  resources :services
  resources :places
  resources :reservations
  resources :affiliates
  resources :admin_users
  resources :accounts
  resources :customers
  
  resources :zone_rates do
    collection do
      get :find_zone_rate
      get :set_is_active
    end
  end
  resources :company_zones
  resources :zip_codes do
    collection do
      get :re_assign_company_zone
    end
  end

  resources :reservations
  resources :rate_groups

  get "/fetch_customers" => "accounts#fetch_customers"


end
