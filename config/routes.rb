Rails.application.routes.draw do
  devise_for :users, skip: %i[sessions password registrations],
                     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

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
      get 'listings/listing/', to: 'mypages#listing'
      get 'listings/in_progress/', to: 'mypages#in_progress'
      get 'listings/completed/', to: 'mypages#completed'
      get 'purchase', to: 'mypages#purchase'
      get 'purchased', to: 'mypages#purchased'
      get ':id/exhibit_item', to: 'mypages#exhibit_item', as: :item_show
      get 'address', to: 'mypages#address'
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
  resources :addresses, only: %i[edit delete] do
    collection do
      get "/", to: 'addresses#new'
      post "/", to: 'addresses#create'
      patch "/", to: 'addresses#update'
    end
  end

  resources :creditcards, only: %i[new show] do
    collection do
      post 'pay', to: 'creditcards#pay'
      post 'delete', to: 'creditcards#delete'
    end
  end

  resources :order, only: %i[index] do
    member do
      get '/buy', to: 'orders#new'
      post '/pay', to: 'orders#pay'
      get '/done', to: 'orders#done'
      get '/failed', to: 'orders#failed'
    end
  end
  resources :addresses, only: %i[new create]
  resources :creditcards, only: %i[new create]

  resources :items, only: %i[new create show destroy] do
    resources :chats, only: [:show]
    collection do
      get 'sell'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
