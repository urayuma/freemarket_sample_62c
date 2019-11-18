require 'rails_helper'

RSpec.describe SignupsController, type: :controller do
  describe "get #step1" do
    it "レスポンスが成功すること" do
      get :step1
      expect(response).to be_successful
    end

    it "200レスポンスを返すこと" do
      get :step1
      expect(response).to have_http_status "200"
    end
  end

  describe "#step1_validates" do
    context "有効なデータの場合" do
      subject do
        user_params = attributes_for(:user)
        post :step1_validates, params: { user: user_params },
                               session: {
                                 nickname: "tanegashiman",
                                 email: "kkk@gmail.com",
                                 password: "123456a",
                                 password_confirmation: "123456a",
                                 lastname: "向井",
                                 firstname: "治",
                                 lastname_kana: "ムカイ",
                                 firstname_kana: "オサム",
                                 birthday_year: 2018,
                                 birthday_month: 12,
                                 birthday_day: 31
                               }
      end
      it "302レスポオンスを返すこと" do
        subject
        expect(response).to have_http_status "302"
      end

      it "電話番号確認ページにリダイレクトすること" do
        subject
        expect(response).to redirect_to step2_signups_path
      end
    end

    context "無効なデータの場合" do
      subject do
        user_params = attributes_for(:user, nickname: "")
        post :step1_validates, params: { user: user_params },
                               session: {
                                 nickname: '',
                                 email: "kkk@gmail.com",
                                 password: "123456a",
                                 password_confirmation: "123456a",
                                 lastname: "向井",
                                 firstname: "治",
                                 lastname_kana: "ムカイ",
                                 firstname_kana: "オサム",
                                 birthday_year: 2018,
                                 birthday_month: 12,
                                 birthday_day: 31
                               }
      end

      it "200レスポオンスを返すこと" do
        subject
        expect(response).to have_http_status "200"
      end

      it "step1にrenderすること" do
        subject
        expect(response).to render_template :step1
      end
    end
  end

  describe "get #step2" do
    before do
      user_params = attributes_for(:user)
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
    end
    it "レスポンスが成功すること" do
      get :step2
      expect(response).to be_successful
    end

    it "200レスポンスを返すこと" do
      get :step2
      expect(response).to have_http_status "200"
    end
  end

  describe "create" do
    context "有効なデータの場合" do
      subject do
        user_params = attributes_for(:user)
        post :create, params: { user: user_params },
                      session: {
                        nickname: "tanegashiman",
                        email: "kkk@gmail.com",
                        password: "123456a",
                        password_confirmation: "123456a",
                        lastname: "向井",
                        firstname: "治",
                        lastname_kana: "ムカイ",
                        firstname_kana: "オサム",
                        birthday_year: 2018,
                        birthday_month: 12,
                        birthday_day: 31
                      }
      end
      it "302レスポンスを返すこと" do
        subject
        expect(response).to have_http_status "302"
      end

      it "送付先登録ページにリダイレクトされること" do
        subject
        expect(response).to redirect_to addresses_path
      end

      it "保存することができる" do
        expect do
          subject
        end.to change { User.count }.by(1)
      end
    end

    context "無効なデータの場合" do
      subject do
        user_params = attributes_for(:user)
        post :create, params: { user: user_params },
                      session: {
                        nickname: "",
                        email: "kkk@gmail.com",
                        password: "123456a",
                        password_confirmation: "123456a",
                        lastname: "向井",
                        firstname: "治",
                        lastname_kana: "ムカイ",
                        firstname_kana: "オサム",
                        birthday_year: 2018,
                        birthday_month: 12,
                        birthday_day: 31
                      }
      end
      it "200レスポンスを返すこと" do
        subject
        expect(response).to have_http_status "200"
      end

      it "step2にrenderされること" do
        subject
        expect(response).to render_template :step2
      end

      it "保存することができない" do
        expect do
          subject
        end.to change { User.count }.by(0)
      end
    end
  end
end
