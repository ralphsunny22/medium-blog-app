Rails.application.routes.draw do
  get '/categories', to: "categories#index"
  post '/categories', to: "categories#create"
  get '/categories/:id', to: "categories#show"
  post '/categories/:id', to: "categories#update" 
  delete '/categories/:id', to: "categories#destroy" 
 
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #post-likes
  get '/post-like/:post_id', to: "apis#like_post"
  get '/post-unlike/:post_id', to: "apis#unlike_post"
  get '/post-likes-unlikes/:post_id', to: "apis#post_likes_and_unlikes" #singlepost likes and unlikes

  # Defines the root path route ("/")
  # root "articles#index"

  # users
  post '/create-user', to: "users#create" 
  post '/login-user', to: "users#login"
end
