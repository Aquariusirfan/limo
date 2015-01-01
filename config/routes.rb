Rails.application.routes.draw do
  devise_for :users
  
  root to: 'home#index'
  
  get '/admin' => "admin/dashboard#index"
  
  namespace :admin do
    resources :companies 
  end
  
  constraints(Subdomain) do
    get '/' => 'home#index'
  end

  resources :vehicle_types
  resources :reservation_settings
  get "/companies/reservation_settings" => "reservation_settings#reservation_setting"


end
