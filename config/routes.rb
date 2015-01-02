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
    end
  end
  resources :reservation_settings 
  resources :rate_setups , only: :index 
  resources :distance_estimation_settings , only: [:edit,:update] 
  resources :services
  resources :places
    

end
