Rails.application.routes.draw do
  resources :products
  resources :drinks
  resources :users
  resources :sessions, only: [:create]
  get "/autologin", to: 'sessions#autologin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
