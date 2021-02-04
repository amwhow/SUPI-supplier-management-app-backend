Rails.application.routes.draw do
  resources :suppliers
  resources :purchase_orders
  resources :invoices
  resources :documents
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  post '/sign_up', to: 'users#create'
  post '/login', to: 'users#sign_in'
  get '/status', to: 'status#index'

  # post '/login', to: 'user_token#create'
  # post '/sign_up', to: 'users#create'
end
