Rails.application.routes.draw do
  
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  root    'sessions#new'
  get     'sessions/new'
  get     '/login', to: 'sessions#new'
  post    '/login', to: 'sessions#create'
  delete  '/logout',to: 'sessions#destroy'
end
