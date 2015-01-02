Rails.application.routes.draw do
  devise_for :users
  
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
    

end
