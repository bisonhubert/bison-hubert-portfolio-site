Rails.application.routes.draw do
  root 'static_pages#under_construction'

  get '/home',      to: 'static_pages#home'
  get '/about',     to: 'static_pages#about'
  get '/portfolio', to: 'static_pages#portfolio'
  get '/resume',    to: 'static_pages#resume'
end
