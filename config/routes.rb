Rails.application.routes.draw do
  resources :ocassion_locations
  resources :messages
  resources :user_occasions
  resources :locations
  resources :occasions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
