Rails.application.routes.draw do

  root 'home#top'
  get '/account', to: 'users#index'
  get '/signup',  to: 'users#new'

  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users
  resources :rooms
  resources :reservations
end
