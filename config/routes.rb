Rails.application.routes.draw do
  resources :suppliers
  resources :purchase_orders
  resources :invoices
  resources :documents
  resources :reviews
  post 'purchase_orders/:id/reviews/new', to: 'reviews#create'
  post 'purchase_orders/:id/invoices/new', to: 'invoices#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # scope '/api' do
  #   scope '/auth' do
  #     post '/sign_up', to: 'users#create'
  #     # post '/login', to: 'user_token#create'
  #     get "/status", to: "status#index"
  #   end
  # end
  post '/sign_up', to: 'users#create'
  post '/login', to: 'users#sign_in'
  get '/status', to: 'status#index'
end
