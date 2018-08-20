Rails.application.routes.draw do
  get 'login', to: 'session#new', as: 'login'
  get 'signup', to: 'users#new', as: 'signup'
  get 'logout', to: 'session#show', as: 'logout'

  resources :users
  resources :sessions

  get 'profile/profile'

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#index'
end
