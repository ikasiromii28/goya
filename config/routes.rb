Rails.application.routes.draw do
  devise_for :users
  root 'calendars#index'
  resources :calendars
  resources :rooms, only: [:index, :new, :create] do
    resources :messages, only: [:index, :create]
  end
  resources :users, except: :create do
    resources :relationships, only: [:create, :destroy]
    member do
    get :followings, :followeds
    end
  end
end