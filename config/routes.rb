Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'signup', to: 'signup#index'
  post 'signup', to: 'signup#create'
  get 'draftersignup', to: 'draftersignup#index'
  post 'draftersignup', to: 'draftersignup#create'
  get 'login', to: 'login#index'
  post 'login', to: 'login#create'
  get 'forgotpassword', to: 'login#forgotpassword'
  get 'posts', to: 'post#index'
  post 'posts', to: 'post#create'
  get 'post/:id', to: 'post#show'
  get 'dashboard', to: 'dashboard#index'
end
