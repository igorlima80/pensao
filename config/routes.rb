Rails.application.routes.draw do
  resources :settings
  
  resources :menu_items
  resources :guests


  resources :cities
  resources :states

  devise_for :users, path: "u"
  resources :users

  # token auth routes available at /api/auth
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    post 'cities/find'
         
    resources :guests, only: [:create, :show]
    
   
  end

  resources :home, only: [:index]

  devise_scope :user do
    authenticated :user do
      root to: 'home#index'
      mount Crono::Web, at: '/crono'
    end

    unauthenticated do
      root to: 'devise/sessions#new'
    end
  end

  post 'utils/zipcode'
  
end
