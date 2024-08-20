# config/routes.rb in Order Service
Rails.application.routes.draw do
  resources :orders, only: [:index, :create]
  root 'orders#index'
end
