Rails.application.routes.draw do
  root to: 'kimochis#index'
  resources :kimochis, only: [:index, :create]
end
