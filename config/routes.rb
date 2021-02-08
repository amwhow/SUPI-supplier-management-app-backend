Rails.application.routes.draw do
  default_url_options :host => "http://localhost:3000"
  resources :suppliers
  resources :purchase_orders
  resources :invoices
  resources :documents
  resources :reviews
  
  post '/sign_up', to: 'users#create'
  post '/login', to: 'users#sign_in'
  get '/status', to: 'status#index'
  # get '/suppliers/:id/purchase_orders', to: 'suppliers#show_pos'

  scope 'dashboard' do
    resources :suppliers
    resources :purchase_orders
    resources :documents
    resources :invoices
    post 'purchase_orders/:id/reviews/new', to: 'reviews#create'
    post 'purchase_orders/:id/invoices/new', to: 'invoices#create'
    scope 'suppliers/:id' do
      resources :purchase_orders
      resources :documents
      resources :invoices
    end
  end
end
