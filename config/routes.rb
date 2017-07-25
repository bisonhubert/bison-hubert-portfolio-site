Rails.application.routes.draw do
  root 'static_pages#home'

  get     '/home',                to: 'static_pages#home'
  get     '/about',               to: 'static_pages#about'
  get     '/resume',              to: 'static_pages#resume'
  get     '/blog',                to: 'articles#index'
  get     '/portfolio',           to: 'projects#index'
  get     '/under_construction',  to: 'static_pages#under_construction'

  get     '/login',               to: 'sessions#new'
  post    '/login',               to: 'sessions#create'
  delete  '/logout',              to: 'sessions#destroy'

  # blog resources
  resources :articles, path: 'blog'
  get     '/scattergories_die',   to: 'static_pages#scattergories_die'
  
  # project resources
  resources :projects, path: 'portfolio'
end
