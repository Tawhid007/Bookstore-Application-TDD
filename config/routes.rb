Rails.application.routes.draw do
  root to: "catalogs#index"
  resources :authors, :publishers, :books
  resources :users, only: [:index, :show, :new, :create]
end
