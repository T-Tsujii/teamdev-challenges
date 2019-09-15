Rails.application.routes.draw do
  root 'homes#index'
  get '/homes/about', to: 'homes#about'
  get '/homes/recruitment', to: 'homes#recruitment'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users
end
