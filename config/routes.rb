Rails.application.routes.draw do
  resources :ocassion_locations
  resources :messages
  resources :user_events
  resources :locations
  resources :occasions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
