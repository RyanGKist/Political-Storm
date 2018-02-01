Rails.application.routes.draw do
  root 'home#index'
  
  get 'articles', to: 'articles#index'

  get 'categories', to: 'categories#index'

  resources :sessions, only: [:create], path: 'login'
  get 'login', to: 'sessions#new', as: :login

  resources :registrations, only: [:create], path: 'signup'
  get 'signup', to: 'registrations#new'
  get 'logout', to: 'sessions#destroy', as: :logout
end
