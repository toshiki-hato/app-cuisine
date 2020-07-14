Rails.application.routes.draw do
  root to: 'tweets#index'
  # resources :users, only: [:edit, :update]
  # get '/users/logout', to: 'users/logout'
  resources :tweets
end
