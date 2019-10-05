Rails.application.routes.draw do
  root 'homes#index'
  get '/homes/about', to: 'homes#about'
  get '/homes/recruitment', to: 'homes#recruitment'
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

  devise_for :users, controllers: {
      omniauth_callbacks: 'omniauth_callbacks',
      confirmations: 'confirmations'
  }

  resources :users, only: [:index, :edit, :show, :update, :destroy]


end
