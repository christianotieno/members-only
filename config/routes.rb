Rails.application.routes.draw do
  
  root 'posts#index'
  resources :posts, only: [:new, :index]
  resources :users, only: [:new, :create]
  resources :sessions, except: [:destroy, :new, :create]
  post '/posts/new', to: 'posts#create'
  get 'posts/index', to: 'posts#index'
  get     '/login', to: 'sessions#new'
  post    '/login', to: 'sessions#create'
  delete  '/logout',to: 'sessions#destroy'

end