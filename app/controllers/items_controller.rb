class ItemsController < ApplicationController
  def sell
    @item = Item.new
    @category = Category.where(ancestry: nil)
    @usage_status = UsageStatus.all
    @delivery_fee = DeliveryFee.all
    @prefectures = Prefecture.all
    @shipping_date = ShippingDate.all
  end

  def create; end

  def get_category_children
    @category_children = Category.find_by(id: params[:parent_id], ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id].to_s).children
  end

  def show
    @item = Item.find(params[:id])
    @category = Category.find(@item.category_id.to_i)
    @brand = Brand.find(@item.brand_id.to_i)
    @like = Like.find(params[:id])
    @user = User.find(@item.user_id.to_i)
    @chats = Chat.where(item_id: params[:id])
  end
end

