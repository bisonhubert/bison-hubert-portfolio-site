Rails.application.routes.draw do
  root 'static_pages#home'

  get '/home',      to: 'static_pages#home'
  get '/about',     to: 'static_pages#about'
  get '/portfolio', to: 'static_pages#under_construction'
  get '/resume',    to: 'static_pages#resume'

  resources :articles
end
