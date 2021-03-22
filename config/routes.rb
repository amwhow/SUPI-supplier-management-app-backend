Rails.application.routes.draw do
  default_url_options host: 'https://warm-peak-06763.herokuapp.com/'
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
  get '/suppliers/:id/pos', to: 'purchase_orders#supplier'
  get '/suppliers/:id/invoices', to: 'purchase_orders#supplier_invoice'
  get '/suppliers/:id/documents', to: 'suppliers#documents'
  get '/suppliers/:id/reviews', to: 'suppliers#show_reviews'

  scope 'suppliers/:id' do
    resources :purchase_orders
    resources :documents
    resources :invoices
  end
end
