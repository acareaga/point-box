Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :users, only: [:show] do
    resources :rewards, only: [:new, :create]
  end
  root to: 'sessions#new'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/purchase',  to: 'users#purchase'

  resources :admin, only: [:show]
  resources :rewards, only: [:show, :index]

  namespace :admin do
    resources :rewards, only: [:new, :create, :edit, :destroy]
    resources :users, only: [:edit, :destroy]
  end
end
