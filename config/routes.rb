Rails.application.routes.draw do
  devise_for :users
  root 'calendars#index'
  #root to:"rooms#index"
  resources :calendars
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
  resources :users, except: :create do
    resources :relationships, only: [:create, :destroy]
    member do
    get :followings, :followeds
    end
  end
end