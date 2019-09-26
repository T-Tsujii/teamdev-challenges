Rails.application.routes.draw do
  root 'homes#index'
  get '/homes/about', to: 'homes#about'
  get '/homes/recruitment', to: 'homes#recruitment'
  post '/homes/guest_login', to: 'homes#guest_login'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', confirmations: 'confirmations' }
  resources :users, only: [:index, :edit, :show, :update, :destroy]
  resources :users do
    resource :my_sites, only: :update
  end
end
