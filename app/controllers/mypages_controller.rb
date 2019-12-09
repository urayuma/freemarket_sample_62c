class MypagesController < ApplicationController
  before_action :sidebar_setting
  before_action :authenticate_user!
  before_action :set_card, only: %i[card card_new]
  before_action :set_search
  before_action :set_brand_rankings

  def index; end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(nickname: user_params[:nickname], introduction: user_params[:introduction])
      redirect_to mypage_index_path
    else
      render :edit
    end
  end

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
    if current_user.user_information.nil?
      @information = current_user.create_user_information
    else
      @information = current_user.user_information
    end
  end

  def listing
    @items = current_user.items.where(selling_status: "1")
  end

  def in_progress
    @items = current_user.items.where(selling_status: "2")
  end

  def completed
    @items = current_user.items.where(selling_status: "3")
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
    @prefectures = Prefecture.all
  end

  def sidebar_setting
    @menulist = ["マイページ", "お知らせ", "やることリスト", "いいね！一覧", "出品する", "出品した商品 - 出品中", "出品した商品 - 取引中", "出品した商品 - 売却済み", "購入した商品 - 取引中", "購入した商品 - 過去の取引", "ニュース一覧", "評価一覧", "ガイド", "お問い合わせ"]
    @linklist = ["/mypage", "/mypage", "/mypage", "/mypage", "/items/sell", "/mypage/listings/listing", "/mypage/listings/in_progress", "/mypage/listings/completed", "/mypage/purchase", "/mypage/purchased"]
    @configlist = ["プロフィール", "発送元・お届け先住所変更", "支払い方法", "メール/パスワード", "本人情報", "電話番号の確認", "ログアウト"]
    @configlinklist = ["/mypage/edit", "/mypage/address", "/mypage/card", "/mypage/", "/mypage/identification", "/mypage/", "/mypage/logout/"]
  end

  private

  def set_card
    @card = current_user.creditcard
  end

  def user_params
    params.require(:user).permit(:nickname, :introduction)
  end
end
