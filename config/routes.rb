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
  get '/post-likes/:post_id', to: "apis#post_likes" #singlepost likes
  get '/post-unlikes/:post_id', to: "apis#post_unlikes" #singlepost unlikes
  get '/user-likes', to: "apis#user_likes" #singleUser likes
  get '/user-unlikes', to: "apis#user_unlikes" #singleUser unlikes

  #user-save-post
  get '/user-save-post/:post_id', to: "apis#user_save_post" #singleUser save post
  get '/user-unsave-post/:post_id', to: "apis#user_unsave_post" #singleUser unsave post

  # Defines the root path route ("/")
  # root "articles#index"

  # users
  post '/create-user', to: "users#create" 
  post '/login-user', to: "users#login"
end
