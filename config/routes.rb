Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  resources :lists do
    resources :reviews, only: [:new, :create, :index]
    resources :products, only: [:new, :create, :edit, :update]
    resources :list_guests, only: [:new, :create]
  end
  resources :reviews, only: [:show, :destroy]
end
