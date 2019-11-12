Rails.application.routes.draw do
  root 'home#index'
  get   'home/index', to: 'home#index'
  get   'mypage/index', to: 'mypage#index'
  get   'mypage/edit', to: 'mypage#edit'
  get   'mypage/card', to: 'mypage#card'
  
  resources :signup do
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
