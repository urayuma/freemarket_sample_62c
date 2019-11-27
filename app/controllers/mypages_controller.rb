class MypagesController < ApplicationController
  before_action :sidebar_setteing
  # before_action :authenticate_user!
  before_action :set_url, only: %i[listing in_progress completed]
  before_action :set_card, only: %i[card card_new]

  def index; end

  def edit; end

  def card
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def card_new
    @month = CreditcardMonth.all
    @year = CreditcardYear.all
    redirect_to action: "card" if @card.present?
  end

  def logout; end

  def identification
    @prefectures = Prefecture.all
  end

  def listing; end

  def in_progress; end

  def completed; end

  def purchase; end

  def purchased; end

  def exhibit_item
    @item = Item.find(params[:id])
  end

  private

  def sidebar_setteing
    @menulist = ["マイページ", "お知らせ", "やることリスト", "いいね！一覧", "出品する", "出品した商品 - 出品中", "出品した商品 - 取引中", "出品した商品 - 売却済み", "購入した商品 - 取引中", "購入した商品 - 過去の取引", "ニュース一覧", "評価一覧", "ガイド", "お問い合わせ"]
    @linklist = ["/mypage", "/info/", "/mustdo/", "/liles_all/", "/出品する/", "/mypage/listings/listing", "/mypage/listings/in_progress", "/mypage/listings/completed", "/mypage/purchase", "/mypage/purchased"]
    @configlist = ["プロフィール", "発送元・お届け先住所変更", "支払い方法", "メール/パスワード", "本人情報", "電話番号の確認", "ログアウト"]
    @configlinklist = ["/myage/edit", "/info/", "/mypage/card", "/shuppin/", "/mypage/identification", "/mypage/", "/mypage/logout/"]
  end

  def set_url
    @url = request.url
  end

  def set_card
    @card = current_user.creditcard
  end
end
