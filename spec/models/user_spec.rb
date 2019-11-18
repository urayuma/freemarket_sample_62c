require 'rails_helper'
describe User do
  describe '#create' do
    it "全ての値が適切に入力されている場合、登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

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

    it "emailが登録済みの場合、登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "emailの中間に@がある場合、登録できること" do
      user = build(:user, email: "email@email")
      expect(user).to be_valid
    end

    it "passwordが空の場合、登録できないこと" do
      user = build(:user, password: "", password_confirmation: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが6文字以下の場合、登録できないこと" do
      user = build(:user, password: "12345q", password_confirmation: "12345q")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください", "は英字と数字両方を含むパスワードを設定してください")
    end

    it "passwordが129文字以上の場合、登録できないこと" do
      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
      password = (0...129).map { o[rand(o.length)] }.join
      user = build(:user, password: password.to_s, password_confirmation: password.to_s)
      user.valid?
      expect(user.errors[:password]).to include("は128文字以内で入力してください")
    end

    it "passwordが数字のみの場合、登録できないこと" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user.errors[:password]).to include("は英字と数字両方を含むパスワードを設定してください")
    end

    it "passwordが英字のみの場合、登録できないこと" do
      user = build(:user, password: "abcdefg", password_confirmation: "abcdefg")
      user.valid?
      expect(user.errors[:password]).to include("は英字と数字両方を含むパスワードを設定してください")
    end

    it "passwordが数字と英字を含む7文字の場合、登録できること" do
      user = build(:user, password: "1a2b3c4", password_confirmation: "1a2b3c4")
      expect(user).to be_valid
    end

    it "passwordが数字と英字を含む128文字の場合、登録できること" do
      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
      password = (0...128).map { o[rand(o.length)] }.join
      user = build(:user, password: password.to_s, password_confirmation: password.to_s)
      expect(user).to be_valid
    end

    it "nicknameが空の場合、登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "nicknameが21文字以上の場合、登録できないこと" do
      nickname = (0...21).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で21文字の文字列を生成
      user = build(:user, nickname: nickname.to_s)
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it "nicknameが20文字以内の場合、登録できること" do
      nickname = (0...20).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で20文字の文字列を生成
      user = build(:user, nickname: nickname.to_s)
      expect(user).to be_valid
    end

    it "lastnameが空の場合、登録できないこと" do
      user = build(:user, lastname: "")
      user.valid?
      expect(user.errors[:lastname]).to include("を入力してください")
    end

    it "lastnameが36文字以上の場合、登録できないこと" do
      lastname = (0...36).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で36文字の文字列を生成
      user = build(:user, lastname: lastname.to_s)
      user.valid?
      expect(user.errors[:lastname]).to include("は35文字以内で入力してください")
    end

    it "lastnameが特殊文字を含む場合、登録できないこと" do
      user = build(:user, lastname: "@＠!！_?><")
      user.valid?
      expect(user.errors[:lastname]).to include("は不正な値です")
    end

    it "lastnameが数字を含む場合、登録できないこと" do
      user = build(:user, lastname: "123１２３")
      user.valid?
      expect(user.errors[:lastname]).to include("は不正な値です")
    end

    it "lastnameが数字や特殊文字を含まず35文字以内の場合、登録できること" do
      lastname = (0...35).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で35文字の文字列を生成
      user = build(:user, lastname: lastname.to_s)
      expect(user).to be_valid
    end

    it "firstnameが空の場合、登録できないこと" do
      user = build(:user, firstname: "")
      user.valid?
      expect(user.errors[:firstname]).to include("を入力してください")
    end

    it "firstnameが36文字以上の場合、登録できないこと" do
      firstname = (0...36).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で36文字の文字列を生成
      user = build(:user, firstname: firstname.to_s)
      user.valid?
      expect(user.errors[:firstname]).to include("は35文字以内で入力してください")
    end

    it "firstnameが特殊文字を含む場合、登録できないこと" do
      user = build(:user, firstname: "@＠!！_?><")
      user.valid?
      expect(user.errors[:firstname]).to include("は不正な値です")
    end

    it "firstnameが数字を含む場合、登録できないこと" do
      user = build(:user, firstname: "123１２３")
      user.valid?
      expect(user.errors[:firstname]).to include("は不正な値です")
    end

    it "firstnameが数字や特殊文字を含まず35文字以内の場合、登録できること" do
      firstname = (0...35).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で35文字の文字列を生成
      user = build(:user, firstname: firstname.to_s)
      expect(user).to be_valid
    end

    it "lastname_kanaが空の場合、登録できないこと" do
      user = build(:user, lastname_kana: "")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("を入力してください")
    end

    it "lastname_kanaが36文字以上の場合、登録できないこと" do
      lastname_kana = ('ア'..'ン').to_a.sample(36).join # カタカナで36文字の文字列を生成
      user = build(:user, lastname_kana: lastname_kana.to_s)
      user.valid?
      expect(user.errors[:lastname_kana]).to include("は35文字以内で入力してください")
    end

    it "lastname_kanaが特殊文字を含む場合、登録できないこと" do
      user = build(:user, lastname_kana: "@＠!！_?><")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("は不正な値です")
    end

    it "lastname_kanaが数字を含む場合、登録できないこと" do
      user = build(:user, lastname_kana: "123１２３")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("は不正な値です")
    end

    it "lastname_kanaがカタカナのみで35文字以内の場合、登録できること" do
      lastname_kana = ('ア'..'ン').to_a.sample(35).join # カタカナで35文字の文字列を生成
      user = build(:user, lastname_kana: lastname_kana.to_s)
      expect(user).to be_valid
    end

    it "firstname_kanaが空の場合、登録できないこと" do
      user = build(:user, firstname_kana: "")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("を入力してください")
    end

    it "firstname_kanaが36文字以上の場合、登録できないこと" do
      firstname_kana = ('ア'..'ン').to_a.sample(36).join # カタカナで36文字の文字列を生成
      user = build(:user, firstname_kana: firstname_kana.to_s)
      user.valid?
      expect(user.errors[:firstname_kana]).to include("は35文字以内で入力してください")
    end

    it "firstname_kanaが特殊文字を含む場合、登録できないこと" do
      user = build(:user, firstname_kana: "@＠!！_?><")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("は不正な値です")
    end

    it "firstname_kanaが数字を含む場合、登録できないこと" do
      user = build(:user, firstname_kana: "123１２３")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("は不正な値です")
    end

    it "firstname_kanaがカタカナのみで35文字以内の場合、登録できること" do
      firstname_kana = ('ア'..'ン').to_a.sample(35).join # カタカナで35文字の文字列を生成
      user = build(:user, firstname_kana: firstname_kana.to_s)
      expect(user).to be_valid
    end

    it "birthday_yearが空の場合、登録できないこと" do
      user = build(:user, birthday_year: nil)
      user.valid?
      expect(user.errors[:birthday_year]).to include("を入力してください")
    end

    it "birthday_yearが1899以下の場合、登録できないこと" do
      user = build(:user, birthday_year: 1899)
      user.valid?
      expect(user.errors[:birthday_year]).to include("は1899より大きい値にしてください")
    end

    it "birthday_yearが2020以上の場合、登録できないこと" do
      user = build(:user, birthday_year: 2020)
      user.valid?
      expect(user.errors[:birthday_year]).to include("は2020より小さい値にしてください")
    end

    it "birthday_yearが1900の場合、登録できること" do
      user = build(:user, birthday_year: 1900)
      expect(user).to be_valid
    end

    it "birthday_yearが2019の場合、登録できること" do
      user = build(:user, birthday_year: 2019)
      expect(user).to be_valid
    end

    it "birthday_monthが空の場合、登録できないこと" do
      user = build(:user, birthday_month: nil)
      user.valid?
      expect(user.errors[:birthday_month]).to include("を入力してください")
    end

    it "birthday_monthが0以下の場合、登録できないこと" do
      user = build(:user, birthday_month: 0)
      user.valid?
      expect(user.errors[:birthday_month]).to include("は0より大きい値にしてください")
    end

    it "birthday_monthが13以上の場合、登録できないこと" do
      user = build(:user, birthday_month: 13)
      user.valid?
      expect(user.errors[:birthday_month]).to include("は13より小さい値にしてください")
    end

    it "birthday_monthが1の場合、登録できること" do
      user = build(:user, birthday_month: 1)
      expect(user).to be_valid
    end

    it "birthday_monthが12の場合、登録できること" do
      user = build(:user, birthday_month: 12)
      expect(user).to be_valid
    end

    it "birthday_dayが空の場合、登録できないこと" do
      user = build(:user, birthday_day: nil)
      user.valid?
      expect(user.errors[:birthday_day]).to include("を入力してください")
    end

    it "birthday_dayが0以下の場合、登録できないこと" do
      user = build(:user, birthday_day: 0)
      user.valid?
      expect(user.errors[:birthday_day]).to include("は0より大きい値にしてください")
    end

    it "birthday_dayが32以上の場合、登録できないこと" do
      user = build(:user, birthday_day: 32)
      user.valid?
      expect(user.errors[:birthday_day]).to include("は32より小さい値にしてください")
    end

    it "birthday_dayが1の場合、登録できること" do
      user = build(:user, birthday_day: 1)
      expect(user).to be_valid
    end

    it "birthday_dayが31の場合、登録できること" do
      user = build(:user, birthday_day: 31)
      expect(user).to be_valid
    end

    it "phonenumberが空の場合、登録できないこと" do
      user = build(:user, phonenumber: "")
      user.valid?
      expect(user.errors[:phonenumber]).to include("を入力してください")
    end

    it "phonenumberが9桁以下の数字の場合、登録できないこと" do
      user = build(:user, phonenumber: "012345678")
      user.valid?
      expect(user.errors[:phonenumber]).to include("登録できません")
    end

    it "phonenumberが12桁以上の数字の場合、登録できないこと" do
      user = build(:user, phonenumber: "012345678912")
      user.valid?
      expect(user.errors[:phonenumber]).to include("登録できません")
    end

    it "phonenumberが数字以外の文字を含む場合、登録できないこと" do
      user = build(:user, phonenumber: "aiueoあいうえお")
      user.valid?
      expect(user.errors[:phonenumber]).to include("登録できません")
    end

    it "phonenumberが登録済みの場合、登録できないこと" do
      user = create(:user)
      another_user = build(:user, phonenumber: user.phonenumber)
      another_user.valid?
      expect(another_user.errors[:phonenumber]).to include("はすでに存在します")
    end

    it "phonenumberが数字のみで10桁の場合、登録できること" do
      user = build(:user, phonenumber: "0312345678")
      expect(user).to be_valid
    end

    it "phonenumberが数字のみで11桁の場合、登録できること" do
      user = build(:user, phonenumber: "09012345678")
      expect(user).to be_valid
    end

    it "imageが空の場合、登録できること" do
      user = build(:user, image: "")
      expect(user).to be_valid
    end

    it "imageがある場合、登録できること" do
      user = build(:user, image: "https://blogimg.goo.ne.jp/user_image/2d/79/1d8407860d8063d31ec552053905c051.jpg")
      expect(user).to be_valid
    end

    it "introductionが空の場合、登録できること" do
      user = build(:user, introduction: "")
      expect(user).to be_valid
    end

    it "introductionが1001文字以上の場合、登録できないこと" do
      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
      introduction = (0...1001).map { o[rand(o.length)] }.join
      user = build(:user, introduction: introduction.to_s)
      user.valid?
      expect(user.errors[:introduction]).to include("は1000文字以内で入力してください")
    end

    it "introductionが1000文字以内の場合、登録できること" do
      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
      introduction = (0...1000).map { o[rand(o.length)] }.join
      user = build(:user, introduction: introduction.to_s)
      expect(user).to be_valid
    end
  end
end
