Rails.application.routes.draw do
  root to: "pages#home"

  resources :lists do
    resources :reviews, only: [:new, :create, :index]
    resources :products, only: [:new, :create, :edit, :update, :destroy]
    resources :list_guests, only: [:new, :create]
  end

  resources :reviews, only: [:show, :destroy]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
