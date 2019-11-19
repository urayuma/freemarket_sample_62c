class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # callback for facebook
  def facebook
    callback_for(:facebook)
  end

  # callback for google
  def google_oauth2
    callback_for(:google)
  end

  # common callback method
  def callback_for(provider)
    info = User.find_oauth(request.env["omniauth.auth"])
    @user = User.where(nickname: info[:user][:nickname]).or(User.where(email: info[:user][:email])).first || info[:user]
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.to_s.capitalize) if is_navigational_format?
    else
      # signups#step1にわたすために
      session[:nickname] = info[:user][:nickname]
      session[:email] = info[:user][:email]
      session[:password_confirmation] = SecureRandom.alphanumeric(30)

      # SnsCredentialが登録されていないとき
      if SnsCredential.find_by(uid: info[:sns][:uid], provider: info[:sns][:provider]).nil?
        session[:uid] = info[:sns][:uid]
        session[:provider] = info[:sns][:provider]
      end
      redirect_to step1_signups_path
    end
  end

  def failure
    redirect_to root_path
  end
end
