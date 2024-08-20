# config/routes.rb in Inventory Service
Rails.application.routes.draw do
  get 'products/availability', to: 'products#availability'
end
