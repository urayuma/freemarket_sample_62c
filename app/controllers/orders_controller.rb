class OrdersController < ApplicationController
  def new
    @item = Item.find(params[:id])
    @user = current_user
    redirect_to action: 'failed' unless @item.selling_status == "出品中"
  end

  def pay
    card = current_user.creditcard
    item = Item.find(params[:id])
    if item.selling_status == "出品中" # あとでselling_statusをID化した場合変更が必要
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
        amount: item.price,
        customer: card.customer_id,
        currency: 'jpy'
      )
      Order.create(item: item, user: current_user)
      item.update(payment_status: "支払済", selling_status: "売却済") # あとでpayment_status、selling_statusをID化した場合変更が必要
      redirect_to action: 'done'
    else
      redirect_to action: 'failed'
    end
  end

  def done
    origin = Rails.application.routes.recognize_path(request.referer) # 直打ちでdoneに行かないようにする
    if origin[:controller] == "orders" && origin[:action] == "new"
      @item = Item.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def failed; end
end
