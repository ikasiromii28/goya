Rails.application.routes.draw do
  devise_for :users
  root 'calendars#index'
  resources :calendars
  resources :rooms, only: [:new, :create]
  resources :users, except: :create do
    resources :follows, only: [:create, :destroy]
    member do
     get :followings, :followeds
    end
  end
end