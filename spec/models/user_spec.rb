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
    
    it "emailの中間に@がある場合、登録できること" do
      user = build(:user, email: "email@email")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが空の場合、登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが6文字以下の場合、登録できないこと" do
      user = build(:user, password: "12345q")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください", "は不正な値です")
    end

    it "passwordが129文字以上の場合、登録できないこと" do
      o = [('a'..'z'),('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten
      password = (0...129).map { o[rand(o.length)] }.join
      user = build(:user, password: "#{password}")
      user.valid?
      expect(user.errors[:password]).to include("は128文字以内で入力してください")
    end

    it "passwordが数字のみの場合、登録できないこと" do
      user = build(:user, password: "1234567")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    it "passwordが英字のみの場合、登録できないこと" do
      user = build(:user, password: "abcdefg")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    it "passwordが数字と英字を含む7文字以上128文字以下の場合、登録できること" do
      user = build(:user, password: "1a2b3c4")
      user.valid?
      expect(user).to be_valid
    end

    it "nicknameが空の場合、登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "nicknameが21文字以上の場合、登録できないこと" do
      nickname = (0...21).map{ ('A'..'Z').to_a[rand(26)] }.join #英字で21文字の文字列を生成
      user = build(:user, nickname: "#{nickname}")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it "nicknameが20文字以内の場合、登録できること" do
      nickname = (0...20).map{ ('A'..'Z').to_a[rand(26)] }.join #英字で20文字の文字列を生成
      user = build(:user, nickname: "#{nickname}")
      user.valid?
      expect(user).to be_valid
    end

    it "lastnameが空の場合、登録できないこと" do
      user = build(:user, lastname: "")
      user.valid?
      expect(user.errors[:lastname]).to include("を入力してください")
    end

    it "lastnameが36文字以上の場合、登録できないこと" do
      lastname = (0...36).map{ ('A'..'Z').to_a[rand(26)] }.join #英字で36文字の文字列を生成
      user = build(:user, lastname: "#{lastname}")
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
      lastname = (0...35).map{ ('A'..'Z').to_a[rand(26)] }.join #英字で35文字の文字列を生成
      user = build(:user, lastname: "#{lastname}")
      user.valid?
      expect(user).to be_valid
    end

    it "firstnameが空の場合、登録できないこと" do
      user = build(:user, firstname: "")
      user.valid?
      expect(user.errors[:firstname]).to include("を入力してください")
    end
    
    it "firstnameが36文字以上の場合、登録できないこと" do
      firstname = (0...36).map{ ('A'..'Z').to_a[rand(26)] }.join #英字で36文字の文字列を生成
      user = build(:user, firstname: "#{firstname}")
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
      firstname = (0...35).map{ ('A'..'Z').to_a[rand(26)] }.join #英字で35文字の文字列を生成
      user = build(:user, firstname: "#{firstname}")
      user.valid?
      expect(user).to be_valid
    end








  end
end