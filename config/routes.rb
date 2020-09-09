Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'signup', to: 'signup#index'
  post 'signup', to: 'signup#create'
  get 'login', to: 'login#index'
  post 'login', to: 'login#create'
end
