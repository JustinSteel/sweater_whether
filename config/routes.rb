Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      # resources :forecasts, only: [:index]
      get '/api/v0/forecast', to: 'forecasts#index'
      resources :users, only: [:create]
    end
  end
end
