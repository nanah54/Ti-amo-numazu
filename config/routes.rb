Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  get 'messages/index'
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end
