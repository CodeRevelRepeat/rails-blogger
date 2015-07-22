Rails.application.routes.draw do

  root to: "posts#index"

  resources :post

  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]
  get 'login' => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
end
