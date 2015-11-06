Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root to: 'sessions#new'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :admin
  resources :rewards, only: [:show]

  namespace :admin do
    resources :rewards, only: [:new, :create, :edit, :destroy]
  end
end
