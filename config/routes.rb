Rails.application.routes.draw do
  get 'signin', to: 'session#signin'
  get 'events/new'
  post 'session/create', to: 'session#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get  '/users/new',  to: 'users#new'
  # get  'users/show/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  resources :users
  resources :events

  root 'users#new'
end
