Rails.application.routes.draw do
  resources :services
  devise_for :users
  get "", to: 'home#index' 

  namespace :panel do
    get "", to: 'dashboard#index'
    resources :users 
    resources :services
  end
end
