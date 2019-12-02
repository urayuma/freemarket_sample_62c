class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  def set_search
    @q = Item.includes(:category).ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname lastname firstname lastname_kana firstname_kana birthday_year birthday_month birthday_day phonenumber])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[nickname introduction])
  end
end
