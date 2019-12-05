class ItemsController < ApplicationController
  before_action :find_item, only: %i[destroy show]
  before_action :authenticate_user!, only: %i[sell create destroy]
  before_action :set_search, only: [:show]
  before_action :set_brand_rankings, only: [:show]

  def sell
    @item = Item.new
    @category = Category.where(ancestry: nil)
    @usage_status = UsageStatus.all
    @delivery_fee = DeliveryFee.all
    @prefectures = Prefecture.all
    @delivery_way = DeliveryWay.all
    @shipping_date = ShippingDate.all
    @item.images.build
  end

  def edit
    @item = Item.find_by(id: params[:id])
    @item.images.build
    @grandchild_category = Category.find(@item.category_id)
    @usage_status = UsageStatus.all
    @delivery_fee = DeliveryFee.all
    @prefectures = Prefecture.all
    @shipping_date = ShippingDate.all
    @brand = Brand.all
    @images = []
    Array(@item.images).each do |image|
      @images << image.image.url
    end
    @deliveryway = if @item.delivery_fee == "送料込み(出品者負担)"
                     DeliveryWay.all
                   else
                     DeliveryWay2.all
                   end
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.valid? && params[:images].present?
        @item.save
        params[:images][:image].each do |image|
          @item.images.create(image: image, item_id: @item.id)
        end
        format.html { redirect_to root_path }
      else
        @category = Category.where(ancestry: nil)
        @usage_status = UsageStatus.all
        @delivery_fee = DeliveryFee.all
        @prefectures = Prefecture.all
        @delivery_way = DeliveryWay.all
        @shipping_date = ShippingDate.all
        @item.images.build
        format.html { render action: 'sell' }
      end
    end
  end

  def get_category_children
    @category_children = Category.find_by(id: params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id].to_s).children
  end

  def get_delivery_way
    @delivery_way = if params[:delivery_fee_id] == "送料込み(出品者負担)"
                      DeliveryWay.all
                    else
                      DeliveryWay2.all
                    end
  end

  def get_brand
    @brand = Brand.all
  end

  def show; end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      Image.where(item: @item).delete_all
      params[:images][:image].each do |image|
        @item.images.create(image: image, item_id: @item.id)
      end
      redirect_to item_show_mypage_index_path(params[:id])
    else
      redirect_to edit_item_path(params[:id])
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to listings_listing_mypage_index_path
    else
      redirect_to item_show_mypage_index_path(@item.id)
    end
  end

  def sellnow
    item = Item.find(params[:id])
    item.update(selling_status: "1")
    redirect_to item_show_mypage_index_path
  end

  def sellstop
    item = Item.find(params[:id])
    item.update(selling_status: "4")
    redirect_to item_show_mypage_index_path
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name,
      :price,
      :size,
      :usage_status,
      :description,
      :selling_status,
      :delivery_fee,
      :delivery_way,
      :delivery_area,
      :shipping_date,
      :user_id,
      :brand_id,
      :category_id,
      :payment_status,
      images_attributes: [:image]
    )
          .merge(user_id: current_user.id, selling_status: 1, payment_status: 2)
  end
end
