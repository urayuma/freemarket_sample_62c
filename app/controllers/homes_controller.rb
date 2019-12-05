class HomesController < ApplicationController
  before_action :set_search
  before_action :set_brand_rankings
  def index
    @items = Item.all

    # @like_rankings = Image.find(Like.group(:item_id).order('count(item_id) desc').limit(4).pluck(:item_id)) if user_signed_in? && Like.where(user_id: current_user.id).any?
    # @like_rankings = Like.find(Like.group(:user_id).order('count(item_id) desc').limit(5).pluck(:user_id)) if user_signed_in? && Like.where(user_id: current_user.id).any?


    root_ids = Item.all.map { |item| item.category.root_id }
    sort_many = root_ids.instance_eval { uniq.sort_by { |x| count x }.reverse }
    @category_rankings = Category.where(id: sort_many[0..3])
  end

  def search
    @category = Category.where(ancestry: nil)
    if params[:q].present?
      @ransack = Item.search(search_params)
      @items = @ransack.result(distinct: true).page(params[:page]).per(40)
    else
      params[:q] = { sorts: 'id desc' }
      @ransack = Item.includes(:category).ransack(params[:q])
      @items = Item.all.page(params[:page]).per(40)
    end
  end

  private

  def search_params
    params.require(:q).permit(:name_cont_any, :sorts)
  end
end

