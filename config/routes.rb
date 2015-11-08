Rails.application.routes.draw do
  root to: 'sessions#new'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/purchase',  to: 'users#purchase'

  resources :rewards, only: [:show, :index]

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :rewards, only: [:new, :create]
  end

  resources :admin do
    resources :rewards, :controller => 'admin/rewards'
    resources :users, :controller => 'admin/users'
  end
end
