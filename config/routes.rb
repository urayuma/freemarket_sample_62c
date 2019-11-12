Rails.application.routes.draw do
  root 'homes#index'
  get 'home/index', to: 'homes#index'
  get 'mypage/index', to: 'mypages#index'
  get 'mypage/edit', to: 'mypages#index'
  get 'mypage/card', to: 'mypages#index'
  
  resources :signups do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
