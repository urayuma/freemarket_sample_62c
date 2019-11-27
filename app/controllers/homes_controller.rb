class HomesController < ApplicationController
  def index
    @like_rankings = Image.find(Like.group(:item_id).order('count(item_id) desc').limit(4).pluck(:item_id))

    @category_rankings = Category.find(Item.group(:category_id).order('count(category_id) desc').limit(4).pluck(:category_id))

    @categorytitle = Category.find(Item.group(:category_id).order('count(category_id) desc').limit(1).pluck(:category_id))

    @categoryitems = Item.where(category_id: @categorytitle[0].id)

    @brand_rankings = Brand.find(Item.group(:brand_id).order('count(brand_id) desc').limit(4).pluck(:brand_id))

    @brandtitle = Brand.find(Item.group(:brand_id).order('count(brand_id) desc').limit(1).pluck(:brand_id))

    @branditems = Item.where(brand_id: @brandtitle[0].id)
  end

  private

  def item_params
    params.permit(:email, :password)
  end
end
