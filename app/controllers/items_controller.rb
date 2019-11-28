class ItemsController < ApplicationController
  before_action :search_item, only: %i[destroy show]
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

  def show; end

  def destroy
    if @item.destroy
      redirect_to listings_listing_mypage_index_path
    else
      redirect_to item_show_mypage_index_path(params[:id])
    end
  end

  def search_item
    @item = Item.find(params[:id])
  end
end
