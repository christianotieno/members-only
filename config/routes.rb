Rails.application.routes.draw do
  get 'users/new'
  root 'posts#index'
  resources :posts, only: %i[new create index]
  resources :users, only: %i[new create]
  resources :sessions
  get 'sessions/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
