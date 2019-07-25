Rails.application.routes.draw do
  resources :customers 
  resources :addresses 
  resources :orders 
end
