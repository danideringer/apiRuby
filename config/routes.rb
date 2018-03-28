Rails.application.routes.draw do
  # When start server (rails s), redirect to localhost:3000/admin
  root to: redirect('/admin')

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Routes for controller data in Controller > input > v1
  namespace :input do
    namespace :v1 do
      resources :data, only: [:create]
    end
  end

  # Routes for controller data in Controller > api > v1
  namespace :api do
    namespace :v1 do
      resources :device_data , only: [:show]
      resources :devices_latest_data , only: [:index]
    end
  end
end
