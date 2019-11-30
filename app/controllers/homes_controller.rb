class HomesController < ApplicationController
  def index
    @items = Item.all

    @like_rankings = Image.find(Like.group(:item_id).order('count(item_id) desc').limit(4).pluck(:item_id)) if user_signed_in? && Like.where(user_id: current_user.id).any?

    root_ids = Item.all.map { |item| item.category.root_id }
    sort_many = root_ids.instance_eval { uniq.sort_by { |x| count x }.reverse }
    @category_rankings = Category.where(id: sort_many[0..3])

    @brand_rankings = Brand.find(Item.group(:brand_id).order('count(brand_id) desc').limit(4).pluck(:brand_id))

  end

  private

  def item_params
    params.permit(:email, :password)
  end
end

