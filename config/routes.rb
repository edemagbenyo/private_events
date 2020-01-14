Rails.application.routes.draw do
  get 'events/new'
  get 'signin', to: 'session#signin'
  post 'session/create', to: 'session#create'
  delete 'logout', to: 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get  '/users/new',  to: 'users#new'
  # get  'users/show/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  patch 'events/:id', to: 'event#update'
  resources :users
  resources :events

  root 'users#new'
end
