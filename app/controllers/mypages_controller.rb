class MypagesController < ApplicationController
  before_action :sidebar_setteing
  def index; end

  def edit; end

  def card; end

  def logout; end

  def identification 
    @prefectures = Prefecture.all
  end

  def sidebar_setteing
    @menulist = ["マイページ","お知らせ","やることリスト","いいね！一覧","出品する","出品した商品 - 出品中","出品した商品 - 取引中","出品した商品 - 売却済み","購入した商品 - 取引中","購入した商品 - 過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ"]
    @linklist = ["/example/","/info/","/mustdo/","/shuppin/","/mypage/"]
    @configlist =["プロフィール","発送元・お届け先住所変更","支払い方法","メール/パスワード","本人情報","電話番号の確認","ログアウト"]
    @configlinklist = ["/example/","/info/","/mustdo/","/shuppin/","/mypage/","/mypage/","/users/signout/"]
  end
end