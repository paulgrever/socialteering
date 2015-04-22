Rails.application.routes.draw do
  #home
  root "home#index"
  get "/business", to: "home#business"
  get "/organization", to: "home#organization"
  get "/about", to: "home#about"

  #session
  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"
  delete "/logout", to: "sessions#destroy"

  #events
  resources :events, only: [:index]
end
