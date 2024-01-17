Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      # resources :forecasts, only: [:index]
      get '/forecast', to: 'forecasts#index'
      resources :users, only: [:create]
      post '/sessions', to: 'sessions#create'
      post '/road_trip', to: 'road_trips#create'
    end
  end
end
