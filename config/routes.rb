Rails.application.routes.draw do
  root 'static_pages#home'

  get '/home',                to: 'static_pages#home'
  get '/about',               to: 'static_pages#about'
  get '/portfolio',           to: 'static_pages#portfolio'
  get '/resume',              to: 'static_pages#resume'
  get '/blog',                to: 'articles#index'
  get '/under_construction',  to: 'static_pages#under_construction'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :articles, path: 'blog'
end
