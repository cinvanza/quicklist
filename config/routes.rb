Rails.application.routes.draw do
  get 'stimulus/dictionary'
  devise_for :users

  root to: "pages#home"
  resources :lists do
    resources :reviews, only: [:new, :create, :index]
    resources :products, only: [:new, :create, :edit, :update, :destroy]
    resources :list_guests, only: [:new, :create, :destroy] do
      collection do
        get 'check_guest'
      end
    end
  end
  resources :reviews, only: [:show, :destroy]
  post '/lists/new' => 'lists#create'
end
