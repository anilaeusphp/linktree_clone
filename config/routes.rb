Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get "user/:id", to: 'dashboard#show', as: :user
  resources :dashboard, only: [:index]
  get "/dashboard", to: "dashboard#index"
  get "appearence", to: "dashboard#appearence", as: :appearence
  root 'dashboard#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
