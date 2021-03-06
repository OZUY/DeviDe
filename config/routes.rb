Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root to: "top#index"
  resources :messages, only: [:create]
  resources :univs, only: [:show, :edit, :update]
end
