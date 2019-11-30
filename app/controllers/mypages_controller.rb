class MypagesController < ApplicationController
  before_action :sidebar_setting
  before_action :authenticate_user!
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
    @information = current_user.user_information
  end

  def listing
    @items = current_user.items.where(selling_status: "出品中").page(params[:page]).per(10)
  end

  def in_progress
    @items = current_user.items.where(selling_status: "取引中").page(params[:page]).per(10)
  end

  def completed
    @items = current_user.items.where(selling_status: "売却済み").page(params[:page]).per(10)
  end

  def purchase
    @items = current_user.items
  end

  def purchased
    @items = current_user.items
  end

  def exhibit_item
    @item = Item.find(params[:id])
  end

  def address
    @address = current_user.address
  end

  def sidebar_setting
    @menulist = ["マイページ", "お知らせ", "やることリスト", "いいね！一覧", "出品する", "出品した商品 - 出品中", "出品した商品 - 取引中", "出品した商品 - 売却済み", "購入した商品 - 取引中", "購入した商品 - 過去の取引", "ニュース一覧", "評価一覧", "ガイド", "お問い合わせ"]
    @linklist = ["/mypage", "/info/", "/mustdo/", "/lieks_all/", "/items/sell", "/mypage/listings/listing", "/mypage/listings/in_progress", "/mypage/listings/completed", "/mypage/purchase", "/mypage/purchased"]
    @configlist = ["プロフィール", "発送元・お届け先住所変更", "支払い方法", "メール/パスワード", "本人情報", "電話番号の確認", "ログアウト"]
    @configlinklist = ["/mypage/edit", "/mypage/address", "/mypage/card", "/メール/パスワード/", "/mypage/identification", "/mypage/", "/mypage/logout/"]
  end

  private

  def set_card
    @card = current_user.creditcard
  end
end
