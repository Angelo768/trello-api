Rails.application.routes.draw do
  resources :boards 
  resources :lists 
  resources :tasks
  resources :users
  mount_devise_token_auth_for 'User', at: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
