Rails.application.routes.draw do
  resources :comments

  post "users/login" => "users#login"
  get "users/index" => "users#index"
  post "users/logout" => "users#logout"

  get "posts/image" => "posts#image"
  post "posts/image_create" => "posts#image_create"
  get "posts/admin" => "posts#admin"

  resources :posts
  # get    'posts'         , to: 'posts#index'
  # post   'posts'         , to: 'posts#create'
  # get    'posts/new'     , to: 'posts#new'    , as: 'new_post'
  # get    'posts/edit/:id', to: 'posts#edit'   , as: 'edit_post'
  # get    'posts/:id'     , to: 'posts#show'   , as: 'post'
  # patch  'posts/:id'     , to: 'posts#update'
  # put    'posts/:id'     , to: 'posts#update'
  # delete 'posts/:id'     , to: 'posts#destroy'

  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
