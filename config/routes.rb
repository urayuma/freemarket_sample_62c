Rails.application.routes.draw do
  root 'home#index'
<<<<<<< HEAD
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
=======
  get  'home/index'  =>  'home#index'
>>>>>>> 29678d912e3d7f6d9cf6a9761a3b3a8ad2fe203f

end
