Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get  '/users/new',  to: 'users#new'
  # get  'users/show/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  resources :users

  root 'users#new'
end
