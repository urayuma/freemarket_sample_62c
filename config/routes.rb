Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  get 'home/index', to: 'homes#index'
  get 'mypage/index', to: 'mypages#index'
  get 'mypage/edit', to: 'mypages#index'
  get 'mypage/card', to: 'mypages#index'
  
  resources :signups, only: [:create] do
    collection do
      get 'step1'
      get 'step2'
    end
  end
end
