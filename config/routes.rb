Rails.application.routes.draw do
  root 'application#index'
  resources :users
  resources :attractions
  resources :sessions, only: [:create, :destroy]
  resources :rides, only: [:create]
  get '/signin', to: "sessions#new", as: 'new_session'
  get '/logout', to: "sessions#destroy", as: 'destroy_session'
end