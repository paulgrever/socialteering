Rails.application.routes.draw do
  #home
  root "home#index"
  get "/business_info", to: "home#business"
  get "/organization_info", to: "home#organization"
  get "/about", to: "home#about"

  #session
  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"
  delete "/logout", to: "sessions#destroy"

  # events
  resources :events
  #organizations
  resources :organizations, except: [:destroy]
  resources :businesses
end
