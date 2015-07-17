Rails.application.routes.draw do
  resources :campaigns do
    get 'new_campaign', on: :collection
    post 'user_create', on: :collection
  end
  resources :encounters
  resources :creatures
  resources :spells
  resources :users
  resources :user_sessions

  root to: 'static#home'

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout

  get '/:page' => 'static#show'
end
