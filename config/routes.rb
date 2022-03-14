Rails.application.routes.draw do
  root to: "products#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :products, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :favourites, only: [:create, :destroy, :index]
  resources :carts, only: [:create, :destroy, :index, :edit, :update]
  resources :payment_infos, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :orders, only: [:create, :show, :edit, :update] do
    member do
      get :complete
    end
  end
  namespace :admin do
    resources :products, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :users, only: [:show, :edit, :update, :index, :destroy]
  end
end