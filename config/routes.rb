Rails.application.routes.draw do
  devise_for :users
  # get 'tweets/index'
  root "tweets#index"
  resources :users, only: [:edit, :update]
end
