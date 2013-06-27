FredsList2::Application.routes.draw do
  resources :posts
  resources :categories

  root to: 'categories#home'

  match '/categories',  to: 'categories#index'
  match '/posts',       to: 'posts#index'
end
