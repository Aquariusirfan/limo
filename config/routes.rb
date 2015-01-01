Rails.application.routes.draw do
  devise_for :users
  
  root to: 'home#index'
  
  get '/admin' => "admin/dashboard#index"
  
  namespace :admin do
    resources :companies 
  end
  
#  constraints(Subdomain) do
#    get '/' => 'home#index'
#  end
  
end
