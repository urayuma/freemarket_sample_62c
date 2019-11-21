class SignupsController < ApplicationController
  before_action :authenticate_user!, only: :done

  def index
    redirect_to root_path if user_signed_in?
  end

  def step1
    @user = if session[:password_confirmation]
              User.new(
                nickname: session[:nickname],
                email: session[:email],
                password: session[:password_confirmation]
              )
            else
              User.new
            end
  end

  def step1_validates
    # step2にデータを渡すためにsessionに入れる
    create_session(user_params)
    set_user_with_session
    @user.valid?
    skip_phonenumber_validate(@user.errors)
    if verify_recaptcha(model: @user, message: "選択してください") && @user.errors.messages.blank? && @user.errors.details.blank?
      redirect_to step2_signups_path
    else
      @user.errors.messages[:birthday_day] = change_birthday_validate_message(@user)
      render :step1
    end
  end

  def step2
    @user = User.new
  end

  def create
    set_user_with_session
    @user[:phonenumber] = user_params[:phonenumber]
    if @user.save
      SnsCredential.create(
        uid: session[:uid],
        provider: session[:provider],
        user_id: @user.id
      )
      sign_in User.find(@user.id) unless user_signed_in?
      redirect_to addresses_path
    else
      render :step2
    end
  end

  def done; end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :lastname, :firstname,
                                 :lastname_kana, :firstname_kana, :birthday_year,
                                 :birthday_month, :birthday_day, :phonenumber)
  end

  def create_session(user_params)
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    if session[:password_confirmation]
      session[:password] = session[:password_confirmation]
    else
      session[:password] = user_params[:password_confirmation]
      session[:password_confirmation] = user_params[:password_confirmation]
    end
    session[:lastname] = user_params[:lastname]
    session[:firstname] = user_params[:firstname]
    session[:lastname_kana] = user_params[:lastname_kana]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:birthday_year] = user_params[:birthday_year]
    session[:birthday_month] = user_params[:birthday_month]
    session[:birthday_day] = user_params[:birthday_day]
  end

  def set_user_with_session
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password_confirmation],
      password_confirmation: session[:password_confirmation],
      lastname: session[:lastname],
      firstname: session[:firstname],
      lastname_kana: session[:lastname_kana],
      firstname_kana: session[:firstname_kana],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day]
    )
  end

  # 電話番号をstep1で入力しないので空のときのバリデーションをスキップする
  def skip_phonenumber_validate(errors)
    errors.messages.delete(:phonenumber)
    errors.details.delete(:phonenumber)
  end

  # 生年月日のどれかにひとつでもバリデーションエラーがあった場合は同じエラーメッセージを表示する
  def change_birthday_validate_message(user)
    if user.errors.messages[:birthday_year].any? || user.errors.messages[:birthday_month].any? || user.errors.messages[:birthday_day].any?
      user.errors.messages.delete(:birthday_year)
      user.errors.messages.delete(:birthday_month)
      user.errors.messages[:birthday_year] = ["生年月日は正しく入力してください"]
    end
  end

  def delete_session
    session.delete(:nickname)
    session.delete(:email)
    session.delete(:password)
    session.delete(:password_confirmation)
    session.delete(:lastname)
    session.delete(:firstname)
    session.delete(:lastname_kana)
    session.delete(:firstname_kana)
    session.delete(:birthday_year)
    session.delete(:birthday_month)
    session.delete(:birthday_day)
    session.delete(:pid)
    session.delete(:provider)
  end
end
