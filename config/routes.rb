Rails.application.routes.draw do
  root to: "catalogs#index"

  get '/signin', to: 'sessions#new', as: 'signin'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signin', to: 'sessions#create'

  resources :authors, :publishers, :books
  resources :users, only: [:index, :show, :new, :create]
end
