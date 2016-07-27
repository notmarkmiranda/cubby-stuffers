Rails.application.routes.draw do
  root to: "packages#index"

  resources :packages, only: [:index, :show]
  resources :users, only: [:new, :create, :show]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/dashboard", to: "users#show", as: :dashboard

  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
end
