Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts, only: [:create, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
  resources :users, except: :create do
    resources :relationships, only: [:create, :destroy]
    member do
      get :followings, :followeds
    end
  end
end