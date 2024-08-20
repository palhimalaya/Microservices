# config/routes.rb
Rails.application.routes.draw do
  resources :shipments, only: [:index]
  root 'shipments#index'
end
