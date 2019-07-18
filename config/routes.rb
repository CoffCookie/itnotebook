Rails.application.routes.draw do


  resources :comments
  post "users/login" => "users#login"
  get "users/index" => "users#index"
  post "users/logout" => "users#logout"


  get "posts/index"
  get "posts/new" => "posts#new"
  get "posts/image" => "posts#image"
  post "posts/create" => "posts#create"
  post "posts/image_create" => "posts#image_create"
  get "posts/admin" => "posts#admin"
  get "posts/edit/:id" => "posts#edit"
  post "posts/update/:id" => "posts#update"
  post "posts/destroy/:id" => "posts#destroy"


  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
