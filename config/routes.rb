Rails.application.routes.draw do
  root 'static_pages#home'

  get '/about',     to: 'static_pages#about'
  get '/resume',    to: 'static_pages#resume'

  resources :projects, :path => 'portfolio'
end
