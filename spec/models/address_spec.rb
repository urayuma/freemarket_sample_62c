require 'rails_helper'
describe Address, type: :model do
  describe '#create' do
    let(:user) { create(:user) }
    it "全ての値が適切に入力されている場合、登録できること" do
      address = build(:address, user_id: user.id)
      expect(address).to be_valid
    end

    it "user_idがnilの場合、登録できないこと" do
      address = build(:address, user_id: nil)
      address.valid?
      expect(address.errors[:user]).to include("を入力してください")
    end

    it "user_idが既にある場合、登録できないこと" do
      create(:address, user_id: user.id)
      address_another = build(:address, user_id: user.id)
      address_another.valid?
      expect(address_another.errors[:user_id]).to include("はすでに存在します")
    end

    it "lastnameが空の場合、登録できないこと" do
      address = build(:address, lastname: "", user_id: user.id)
      address.valid?
      expect(address.errors[:lastname]).to include("を入力してください")
    end

    it "lastnameが36文字以上の場合、登録できないこと" do
      address = build(:address, lastname: "a" * 36, user_id: user.id)
      address.valid?
      expect(address.errors[:lastname]).to include("は35文字以内で入力してください")
    end

    it "lastnameが35文字の場合、登録できること" do
      address = build(:address, lastname: "a" * 35, user_id: user.id)
      expect(address).to be_valid
    end

    it "firstnameが空の場合、登録できないこと" do
      address = build(:address, firstname: "", user_id: user.id)
      address.valid?
      expect(address.errors[:firstname]).to include("を入力してください")
    end

    it "firstnameが36文字以上の場合、登録できないこと" do
      address = build(:address, firstname: "a" * 36, user_id: user.id)
      address.valid?
      expect(address.errors[:firstname]).to include("は35文字以内で入力してください")
    end

    it "firstnameが35文字の場合、登録できること" do
      address = build(:address, firstname: "a" * 35, user_id: user.id)
      expect(address).to be_valid
    end

    it "lastname_kanaが36文字以上の場合、登録できないこと" do
      address = build(:address, lastname_kana: "ア" * 36, user_id: user.id)
      address.valid?
      expect(address.errors[:lastname_kana]).to include("は35文字以内で入力してください")
    end

    it "lastname_kanaが空の場合、登録できないこと" do
      address = build(:address, lastname_kana: "", user_id: user.id)
      address.valid?
      expect(address.errors[:lastname_kana]).to include("を入力してください")
    end

    it "lastname_kanaがひらがなの場合、登録できないこと" do
      address = build(:address, lastname_kana: "ああああああ", user_id: user.id)
      address.valid?
      expect(address.errors[:lastname_kana]).to include("全角カタカナ以外は使用できません")
    end

    it "lastname_kanaが漢字の場合、登録できないこと" do
      address = build(:address, lastname_kana: "田中", user_id: user.id)
      address.valid?
      expect(address.errors[:lastname_kana]).to include("全角カタカナ以外は使用できません")
    end

    it "lastname_kanaがアルファベットの場合、登録できないこと" do
      address = build(:address, lastname_kana: "aaaaaa", user_id: user.id)
      address.valid?
      expect(address.errors[:lastname_kana]).to include("全角カタカナ以外は使用できません")
    end

    it "lastname_kanaが35文字の場合、登録できること" do
      address = build(:address, lastname_kana: "ア" * 35, user_id: user.id)
      expect(address).to be_valid
    end

    it "firstname_kanaが36文字以上の場合、登録できないこと" do
      address = build(:address, firstname: "ア" * 36, user_id: user.id)
      address.valid?
      expect(address.errors[:firstname]).to include("は35文字以内で入力してください")
    end

    it "firstname_kanaが空の場合、登録できないこと" do
      address = build(:address, firstname_kana: "", user_id: user.id)
      address.valid?
      expect(address.errors[:firstname_kana]).to include("を入力してください")
    end

    it "firstname_kanaがひらがなの場合、登録できないこと" do
      address = build(:address, firstname_kana: "ああああああ", user_id: user.id)
      address.valid?
      expect(address.errors[:firstname_kana]).to include("全角カタカナ以外は使用できません")
    end

    it "firstname_kanaが漢字の場合、登録できないこと" do
      address = build(:address, firstname_kana: "田中", user_id: user.id)
      address.valid?
      expect(address.errors[:firstname_kana]).to include("全角カタカナ以外は使用できません")
    end

    it "firstname_kanaがアルファベットの場合、登録できないこと" do
      address = build(:address, firstname_kana: "aaaaaa")
      address.valid?
      expect(address.errors[:firstname_kana]).to include("全角カタカナ以外は使用できません")
    end

    it "firstname_kanaが35文字の場合、登録できること" do
      address = build(:address, firstname: "ア" * 35, user_id: user.id)
      expect(address).to be_valid
    end

    it "postcodeが空の場合、登録できないこと" do
      address = build(:address, postcode: "", user_id: user.id)
      address.valid?
      expect(address.errors[:postcode]).to include("を入力してください")
    end

    it "postcodeが3桁-5桁の場合、登録できないこと" do
      address = build(:address, postcode: "111-11111", user_id: user.id)
      address.valid?
      expect(address.errors[:postcode]).to include("フォーマットが不適切です")
    end

    it "postcodeが2桁-4桁の場合、登録できないこと" do
      address = build(:address, postcode: "11-1111", user_id: user.id)
      address.valid?
      expect(address.errors[:postcode]).to include("フォーマットが不適切です")
    end

    it "postcodeが数字以外の場合、登録できないこと" do
      address = build(:address, postcode: "aaa-aaaa", user_id: user.id)
      address.valid?
      expect(address.errors[:postcode]).to include("フォーマットが不適切です")
    end

    it "postcodeが3桁-4桁の場合、登録できること" do
      address = build(:address, postcode: "123-4567", user_id: user.id)
      expect(address).to be_valid
    end

    it "prefecturesが空の場合、登録できないこと" do
      address = build(:address, prefectures: "", user_id: user.id)
      address.valid?
      expect(address.errors[:prefectures]).to include("を入力してください")
    end

    it "prefecturesがある場合、登録できること" do
      address = build(:address, prefectures: "東京都", user_id: user.id)
      expect(address).to be_valid
    end

    it "cityが空の場合、登録できないこと" do
      address = build(:address, city: "", user_id: user.id)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "cityが51文字以上の場合、登録できないこと" do
      address = build(:address, city: "a" * 51, user_id: user.id)
      address.valid?
      expect(address.errors[:city]).to include("は50文字以内で入力してください")
    end

    it "cityが35文字の場合、登録できること" do
      address = build(:address, city: "a" * 35, user_id: user.id)
      expect(address).to be_valid
    end

    it "street_numが空の場合、登録できないこと" do
      address = build(:address, street_num: "", user_id: user.id)
      address.valid?
      expect(address.errors[:street_num]).to include("を入力してください")
    end

    it "street_numが101文字以上の場合、登録できないこと" do
      address = build(:address, street_num: "a" * 101, user_id: user.id)
      address.valid?
      expect(address.errors[:street_num]).to include("は100文字以内で入力してください")
    end

    it "street_numが100文字の場合、登録できること" do
      address = build(:address, street_num: "a" * 100, user_id: user.id)
      expect(address).to be_valid
    end

    it "buildingが101文字以上の場合、登録できないこと" do
      address = build(:address, building: "a" * 101, user_id: user.id)
      address.valid?
      expect(address.errors[:building]).to include("は100文字以内で入力してください")
    end

    it "buildingが100文字の場合、登録できること" do
      address = build(:address, building: "a" * 100, user_id: user.id)
      expect(address).to be_valid
    end

    it "home_call_numが101文字以上の場合、登録できないこと" do
      address = build(:address, home_call_num: "1" * 101, user_id: user.id)
      address.valid?
      expect(address.errors[:home_call_num]).to include("は100文字以内で入力してください")
    end

    it "home_call_numが9桁の数字の場合、登録できないこと" do
      address = build(:address, home_call_num: "123456789", user_id: user.id)
      address.valid?
      expect(address.errors[:home_call_num]).to include("は10~11桁の数字を入力してください")
    end

    it "home_call_numが12桁の数字の場合、登録できないこと" do
      address = build(:address, home_call_num: "123456789012", user_id: user.id)
      address.valid?
      expect(address.errors[:home_call_num]).to include("は10~11桁の数字を入力してください")
    end

    it "home_call_numが数字以外の場合、登録できないこと" do
      address = build(:address, home_call_num: "aiueoaiueo", user_id: user.id)
      address.valid?
      expect(address.errors[:home_call_num]).to include("は10~11桁の数字を入力してください")
    end

    it "home_call_numが登録済みの場合、登録できないこと" do
      user = create(:address)
      another_user = build(:address, home_call_num: user.home_call_num, user_id: user.id)
      another_user.valid?
      expect(another_user.errors[:home_call_num]).to include("はすでに存在します")
    end

    it "home_call_numが10桁の数字の場合、登録できること" do
      address = build(:address, home_call_num: "0312345678", user_id: user.id)
      expect(address).to be_valid
    end

    it "home_call_numが11桁の数字の場合、登録できること" do
      address = build(:address, home_call_num: "09012345678", user_id: user.id)
      expect(address).to be_valid
    end
  end
end
