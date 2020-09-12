Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'signup', to: 'signup#index'
  post 'signup', to: 'signup#create'
  get 'draftersignup', to: 'draftersignup#index'
  post 'draftersignup', to: 'draftersignup#create'
  get 'contractorsignup', to: 'contractorsignup#index'
  post 'contractorsignup', to: 'contractorsignup#create'
  get 'login', to: 'login#index'
  post 'login', to: 'login#create'
  get 'forgotpassword', to: 'login#forgotpassword'
  get 'posts', to: 'post#index'
  post 'posts', to: 'post#create'
  get 'post/:id', to: 'post#show'
  post 'post/images/:id', to: 'post#images'
  post 'post/comments/:id', to: 'post#comments'
  get 'dashboard', to: 'dashboard#index'
  get 'logout', to: 'logout#index'
end
