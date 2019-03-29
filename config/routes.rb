Rails.application.routes.draw do
  resources :friends
  post '/friends/accept', to: "friends#accept"
  resources :messages
  resources :user_occasions
  resources :locations
  post '/occasions/:id/new_attendee', to: "occasions#new_attendee"
  resources :occasions
  resources :users

  get '/', to: 'users#home'

  get '/login', to: 'sessions#new'#form
  post '/sessions', to: 'sessions#create' #log the user in
  get '/logout', to: 'sessions#destroy'


end
