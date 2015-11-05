Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show], param: :username

  # namespace :admin do
  #   resources :rewards
  # end
end
