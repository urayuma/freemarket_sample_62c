require 'rails_helper'
describe User do
  describe '#create' do

    it "emailが空の場合、登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailの中間に@がない場合、登録できないこと" do
      user = build(:user, email: "email")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordが空の場合、登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "nicknameが空の場合、登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "nicknameが21文字以上の場合、登録できないこと" do
      name = (0...21).map{ ('A'..'Z').to_a[rand(26)] }.join #英字で21文字の文字列を生成
      user = build(:user, nickname: "#{name}")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

  end
end