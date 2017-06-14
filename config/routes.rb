Rails.application.routes.draw do
  get 'users/new'

  root 'static_pages#home'

  get '/home',                to: 'static_pages#home'
  get '/about',               to: 'static_pages#about'
  get '/portfolio',           to: 'static_pages#portfolio'
  get '/resume',              to: 'static_pages#resume'
  get '/blog',                to: 'articles#index'
  get '/under_construction',  to: 'static_pages#under_construction'

  resources :users
  resources :articles
end
