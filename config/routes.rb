Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :index, :destroy]
  resources :products, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end