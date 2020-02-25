Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :events do
    resources :requests


  resources :requests do
    resources :messages, only: [:new, :create]
  end
  resources :messages, except: [:new, :create]

  end

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
