Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # resource :dashboard, only: :show, controller: :dashboard
  get 'dashboard', to: 'dashboard#show'
  patch 'contact_update', to: 'dashboard#update'

  get 'profiles', to: 'profiles#index'
  resources :profiles, only: [ :show ]
  # get 'profiles/:id', to: 'profiles#show'

  resources :events do
    resources :contact_requests, only: [:new, :create]
  end

  resources :contact_requests, except: [:new, :create] do
    resources :messages, only: [:new, :create]
  end
  resources :messages, only: [:new, :create]

end
