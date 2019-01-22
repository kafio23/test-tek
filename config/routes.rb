Rails.application.routes.draw do
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # devise_for :users
  post 'auth_user' => 'authentication#authenticate_user'
  root 'home#index'
  get "test", to: "home#test"
  resources :users
  resources :purchases
  get "purchases-list", to: "purchases#list"
  # resources :purchases, only:[:index, ] do
  # end
  # get 'home/index'

  ## API
  namespace :api do
    namespace :v1 do
      resources :users
      resources :purchases
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
