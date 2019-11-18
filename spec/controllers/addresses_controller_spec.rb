require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  let(:user) { create(:user) }

  describe "get #step1" do
    context "ログイン済みユーザ" do
      it "レスポンスが成功すること" do
        sign_in user
        get :new
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in user
        get :new
        expect(response).to have_http_status "200"
      end
    end

    context "非ログインユーザ" do
      it "302レスポンスを返すこと" do
        get :new
        expect(response).to have_http_status "302"
      end

      it "devise/sessions#newにリダイレクトされること" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "create" do
    context "ログイン済みユーザ" do
      before do
        sign_in user
      end
      context "有効なデータの場合" do
        subject do
          address_params = attributes_for(:address, user: user)
          post :create, params: { address: address_params }
        end
        it "302レスポンスを返すこと" do
          subject
          expect(response).to have_http_status "302"
        end

        it "creditcards#newにリダイレクトされること" do
          subject
          expect(response).to redirect_to new_creditcard_path
        end

        it "保存することができる" do
          expect do
            subject
          end.to change { Address.count }.by(1)
        end
      end

      context "無効なデータの場合" do
        subject do
          address_params = attributes_for(:address, lastname: "", user: user)
          post :create, params: { address: address_params }
        end
        it "200レスポンスを返すこと" do
          subject
          expect(response).to have_http_status "200"
        end

        it "creditcards#newにrenderされること" do
          subject
          expect(response).to render_template :new
        end

        it "保存することができない" do
          expect do
            subject
          end.to change { Address.count }.by(0)
        end
      end
    end

    context "非ログインユーザ" do
      subject do
        address_params = attributes_for(:address, user: user)
        post :create, params: { address: address_params }
      end
      it "302レスポンスを返すこと" do
        subject
        expect(response).to have_http_status "302"
      end

      it "devise/sessions#newにリダイレクトされること" do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
