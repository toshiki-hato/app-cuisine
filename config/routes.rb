Rails.application.routes.draw do
  get 'blogs/index'
  devise_for :users
  root to: 'tweets#index'
  resources :blogs
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
