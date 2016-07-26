Rails.application.routes.draw do
  root to: "products#index"

  resources :products, only: [:index, :show]
  resources :users, only: [:new, :create, :show]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show", as: :dashboard
end
