Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  get 'home/index', to: 'homes#index'
  get 'mypage/index', to: 'mypages#index'
  get 'mypage/edit', to: 'mypages#edit'
  get 'mypage/card', to: 'mypages#index'
  get 'mypage/logout', to: 'mypages#logout'

  resources :signups, only: [:index] do
    collection do
      get 'step1'
      post 'step1', to: 'signups#step1_validates'
      get 'step2'
<<<<<<< HEAD
      post 'step2', to: 'signups#create'
    end
  end
  resources :addresses, only: %i[edit update delete] do
    collection do
      get "/", to: 'addresses#new'
      post "/", to: 'addresses#create'
=======
      get 'done'
>>>>>>> registration_step5
    end
  end
  resources :addresses, only: [:new, :create]
  resources :creditcards, only: [:new, :create]
end
