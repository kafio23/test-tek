Rails.application.routes.draw do
  # devise_for :users
  post 'auth_user' => 'authentication#authenticate_user'
  root 'home#index'
  get "test", to: "home#test"
  resources :users
  # get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
