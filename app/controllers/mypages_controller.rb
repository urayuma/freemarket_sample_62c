class MypagesController < ApplicationController
  before_action :sidebar_setteing
  before_action :authenticate_user!

  def index; end

  def edit; end

  def card; end

  def card_new; end

  def logout; end

  def identification
    @prefectures = Prefecture.all
  end

  def sidebar_setteing
    @menulist = ["マイページ", "お知らせ", "やることリスト", "いいね！一覧", "出品する", "出品した商品 - 出品中", "出品した商品 - 取引中", "出品した商品 - 売却済み", "購入した商品 - 取引中", "購入した商品 - 過去の取引", "ニュース一覧", "評価一覧", "ガイド", "お問い合わせ"]
    @linklist = ["/mypage", "/info/", "/mustdo/", "/shuppin/", "/mypage/"]
    @configlist = ["プロフィール", "発送元・お届け先住所変更", "支払い方法", "メール/パスワード", "本人情報", "電話番号の確認", "ログアウト"]
    @configlinklist = ["/mypage/edit", "/info/", "/mypage/card", "/shuppin/", "/mypage/identification", "/mypage/", "/mypage/logout/"]
  end
end
