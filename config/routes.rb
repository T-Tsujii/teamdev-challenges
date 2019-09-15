Rails.application.routes.draw do
  root 'home#index'
  get '/home/about', to: 'home#about'
  get '/home/recruitment', to: 'home#recruitment'
  devise_for :users
  resources :users
end
