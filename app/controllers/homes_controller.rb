class HomesController < ApplicationController
  before_action :set_search
  def index
    @items = Item.all

    @like_rankings = Image.find(Like.group(:item_id).order('count(item_id) desc').limit(4).pluck(:item_id)) if user_signed_in? && Like.where(user_id: current_user.id).any?

    root_ids = Item.all.map { |item| item.category.root_id }
    sort_many = root_ids.instance_eval { uniq.sort_by { |x| count x }.reverse }
    @category_rankings = Category.where(id: sort_many[0..3])

    @brand_rankings = Brand.find(Item.group(:brand_id).order('count(brand_id) desc').limit(4).pluck(:brand_id))

  end

  def search
    @category = Category.where(ancestry: nil)
    if params[:q].present?
      @q = Item.search(search_params)
      @items = @q.result(distinct: true).page(params[:page]).per(40)
      if search_params[:category_id_eq_any].present?
        root_category = Category.find(search_params[:category_id_eq_any])
        categories = []
        if root_category.has_parent? && root_category.has_children?
          categories.push(root_category.child_ids)
          @items = Item.where(category_id: categories)
        elsif root_category.indirect_ids
          categories.push(root_category.indirect_ids)
          @items = Item.where(category_id: categories)
        else

        end
      end
    else
      params[:q] = { sorts: 'id desc' }
      @q = Item.includes(:category).ransack(params[:q])
      @items = Item.all
      @category = Category.where(ancestry: nil)
    end
  end

  def get_category_children
    @category_children = Category.find_by(id: params[:parent_id], ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id].to_s).children
  end

  private
  def search_params
    params.require(:q).permit(:name_cont_any, :sorts, {:category_id_in => []})
  end
end

