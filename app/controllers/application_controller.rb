class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday_year])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday_month])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday_day])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phonenumber])

    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:introduction])
  end
end