Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, skip: :registrations
  devise_scope :user do
    resource :registration,
      only: [:new, :create],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'devise/registrations',
      as: :user_registration do
        get :cancel
      end
  end

  get "", to: 'home#index' 
  
  namespace :panel do
    get "", to: 'dashboard#index'
    resources :users 
    resources :services
    resources :packages do
      resources :package_services, only: [:new, :create, :destroy]
    end
  end
end
