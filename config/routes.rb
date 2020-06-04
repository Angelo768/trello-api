Rails.application.routes.draw do
  get 'dashboard/root'
  resources :boards 
  resources :lists 
  resources :tasks
  resources :users
  mount_devise_token_auth_for 'User', at: 'user'
  root to: "dashboard#root"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
