Rails.application.routes.draw do
  default_url_options :host => "http://localhost:3000"
  resources :suppliers
  resources :purchase_orders
  resources :invoices
  resources :documents
  resources :reviews
  post 'purchase_orders/:id/reviews/new', to: 'reviews#create'
  post 'purchase_orders/:id/invoices/new', to: 'invoices#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  post '/sign_up', to: 'users#create'
  post '/login', to: 'users#sign_in'
  get '/status', to: 'status#index'
  get '/suppliers/:id/purchase_orders', to: 'suppliers#show_pos'

  # post '/login', to: 'user_token#create'
  # post '/sign_up', to: 'users#create'
end
