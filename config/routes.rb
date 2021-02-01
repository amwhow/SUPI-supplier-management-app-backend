Rails.application.routes.draw do
  resources :suppliers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # scope '/api' do
  #   scope '/auth' do
  #     post '/sign_up', to: 'users#create'
  #     # post '/login', to: 'user_token#create'
  #     get "/status", to: "status#index"
  #   end
  # end
  post '/login', to: 'user_token#create'
  get '/status', to: 'status#index'
  post '/sign_up', to: 'users#create'
end
