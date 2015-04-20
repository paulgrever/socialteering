Rails.application.routes.draw do
  root "home#index"
  get "/business", to: "home#business"
  get "/organization", to: "home#organization"
  resources :events, only: [:index] 
end
