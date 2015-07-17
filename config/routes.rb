Rails.application.routes.draw do
  resources :encounters

  resources :creatures

  resources :spells

  root to: 'static#home'

  resources :users
  resources :user_sessions

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout

  get '/:page' => 'static#show'
end
