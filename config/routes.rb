Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      # resources :forecasts, only: [:index]
      get "/forecast", to: "forecasts#index"
    end
  end
  namespace :api do
    namespace :v1 do
      get "/munchies", to: "munchies#index"
    end
  end
end
