Rails.application.routes.draw do
  get    "/auth/:provider/callback", to: "sessions#create"
  get    "/auth/failure",            to: "sessions#failure"
  delete "/logout",                  to: "sessions#destroy"
  root "home#index"
  get "/business", to: "home#business"
  get "/organization", to: "home#organization"
  resources :events, only: [:index]
end
