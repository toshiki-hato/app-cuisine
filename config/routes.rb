Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  # resources :users, only: [:edit, :update]
  # get '/users/logout', to: 'users/logout'
  resources :tweets
  resources :users, only: :show
end
