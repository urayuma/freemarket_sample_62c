Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'homes#index'
  get 'home/index', to: 'homes#index'

  resources :mypage, only: [:index] do
    collection do
      get '/',    to: 'mypages#index'
      get 'edit', to: 'mypages#edit'
      get 'card', to: 'mypages#card'
      get 'card/new', to: 'mypages#card_new'
      get 'logout', to: 'mypages#logout'
      get 'identification', to: 'mypages#identification'
    end
  end

  resources :signups, only: [:index] do
    collection do
      get 'step1'
      post 'step1', to: 'signups#step1_validates'
      get 'step2'
      post 'step2', to: 'signups#create'
      get 'done'
    end
  end
  resources :addresses, only: %i[edit update delete] do
    collection do
      get "/", to: 'addresses#new'
      post "/", to: 'addresses#create'
    end
  end
  resources :addresses, only: %i[new create]
  resources :creditcards, only: %i[new create]
  resources :order, only: %i[index] do
    member do
      get '/buy', to: 'orders#new'
    end
  end
end
