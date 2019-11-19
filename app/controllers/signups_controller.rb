class SignupsController < ApplicationController
  # before_action :step1_validates, only: :step2
  def step1
    @user = User.new
  end

  def step1_validates
    # step2にデータを渡すためにsessionに入れる
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password_confirmation]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:lastname] = user_params[:lastname]
    session[:firstname] = user_params[:firstname]
    session[:lastname_kana] = user_params[:lastname_kana]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:birthday_year] = user_params[:birthday_year]
    session[:birthday_month] = user_params[:birthday_month]
    session[:birthday_day] = user_params[:birthday_day]
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

  def done; end

  def create
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
      birthday_day: session[:birthday_day],
      phonenumber: user_params[:phonenumber]
    )
    if @user.save
      sign_in User.find(@user.id) unless user_signed_in?
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
      redirect_to addresses_path
    else
      render :step2
    end
  end

  private

    def user_params
      params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :lastname, :firstname,
                                  :lastname_kana, :firstname_kana, :birthday_year,
                                  :birthday_month, :birthday_day, :phonenumber)
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
end
