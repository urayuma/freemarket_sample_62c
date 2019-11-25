class HomesController < ApplicationController
  def index
    @images = Image.order("RAND()").limit(4)

    @categories = Category.where( ancestry: nil ).order("RAND()").limit(4)
    # @categories = Category.where( id:1..13 ).order("RAND()").limit(4)

    @categorytitle = Category.where( ancestry: nil ).order("RAND()").limit(1)
    # @categorytitle = Category.where( id:1..13 ).order("RAND()").limit(1)

    @categoryitems = Item.where(category_id: @categorytitle[0].id)

    @brands = Brand.order("RAND()").limit(4)

    @brandtitle = Brand.order("RAND()").limit(1)

    @branditems = Item.where(brand_id: @brandtitle[0].id)
  end

  private
  def item_params
    params.permit(:email, :password)
  end


end
