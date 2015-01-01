Rails.application.routes.draw do
  devise_for :users
  
  root to: 'home#index'
  
  get '/admin' => "admin/dashboard#index"
  
  namespace :admin do
    resources :companies 
  end
  
  resources :vehicle_types
  resources :reservation_settings
  #  do
  #    collection do
  #      get "reservation_setting"
  #    end
  #  end
  get "/companies/reservation_settings" => "reservation_settings#reservation_setting"

end
