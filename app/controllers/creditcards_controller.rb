class CreditcardsController < ApplicationController
  require "payjp"
  before_action :set_card, only: %i[new delete]

  def new
    @month = CreditcardMonth.all
    @year = CreditcardYear.all
    redirect_to controller: :signups, action: :done if @card.present?
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if pay_params[:"payjp-token"].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: pay_params[:"payjp-token"],
        metadata: { user_id: current_user.id }
      )
      @card = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      origin = Rails.application.routes.recognize_path(request.referer)
      if @card.save && origin[:controller] == "creditcards" && origin[:action] == "new"
        redirect_to controller: :signups, action: :done
      elsif @card.save && origin[:controller] == "mypages" && origin[:action] == "card_new"
        redirect_to controller: :mypages, action: :card
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
    redirect_to controller: :mypages, action: :card
  end

  def set_card
    @card = current_user.creditcard
  end

  private

  def pay_params
    params.permit(:"payjp-token")
  end
end
