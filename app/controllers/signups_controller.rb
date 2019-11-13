class SignupsController < ApplicationController
  def step1
    @user = User.new
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:lastname] = user_params[:lastname]
    session[:firstname] = user_params[:firstname]
    session[:lastname_kana] = user_params[:lastname_kana]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:birthday_year] = user_params[:birthday_year]
    session[:birthday_month] = user_params[:birthday_month]
    session[:birthday_day] = user_params[:birthday_day]
    @user = User.new
  end

  def creata
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
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
      session[:user_id] = @user.id
      redirect_to new_address_path
    else
      render '/signup/step2'
    end
  end

  private

    def user_params
      params.require(:user).permit(:nickname, :email, :password, :lastname, :firstname,
                                    :lastname_kana, :firstname_kana, :birthday_year,
                                    :birthday_month, :birthday_day, :phonenumber)
    end

    def validates_step1
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
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
        password: session[:password],
        lastname: session[:lastname],
        firstname: session[:firstname],
        lastname_kana: session[:lastname_kana],
        firstname_kana: session[:firstname_kana],
        birthday_year: session[:birthday_year],
        birthday_month: session[:birthday_month],
        birthday_day: session[:birthday_day],
        phonenumber: 0000000000
      )
      render '/signup/step1' unless @user.valid?
    end
  end
end
