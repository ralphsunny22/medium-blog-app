Rails.application.routes.draw do
  get '/categories', to: "categories#index"
  post '/categories', to: "categories#create"
  get '/categories/:id', to: "categories#show"
  post '/categories/:id', to: "categories#update" 
  delete '/categories/:id', to: "categories#destroy" 
 
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # users
  post '/create-user', to: "users#create" 
  post '/login-user', to: "users#login"
end
