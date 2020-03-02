Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'dashboard#show'

  resources :events do
    resources :contact_requests, only: [:new, :create]
  end

  resources :contact_requests, except: [:new, :create] do
    resources :messages, only: [:new, :create]
  end
  resources :messages, only: [:new, :create]

end
