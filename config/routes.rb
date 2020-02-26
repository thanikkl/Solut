Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :events do
    resources :contact_requests
  end

  resources :contact_requests do
    resources :messages, only: [:new, :create]
  end
  resources :messages, except: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
