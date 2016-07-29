Rails.application.routes.draw do
  root to: "packages#index"

  resources :packages, only: [:index, :show]
  resources :users, only: [:new, :create, :show]
  resources :subscriptions, only: [:create, :show]

  resources :charges, only: [:new, :create]

  namespace :admin do
    get "/dashboard", to: "users#show"
    resources :fulfillments, only: [:index, :show]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/dashboard", to: "users#show"

  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
end
