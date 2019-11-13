require 'rails_helper'
describe Address, type: :model do
  describe '#create', focus: true do

    it "全ての値が適切に入力されている場合、登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "lastnameが空の場合、登録できないこと" do
      address = build(:address, lastname: "")
      address.valid?
      expect(address.errors[:lastname]).to include("を入力してください")
    end

    it "lastnameが36文字以上の場合、登録できないこと" do
      address = build(:address, lastname: "a"*36)
      address.valid?
      expect(address.errors[:lastname]).to include("は35文字以内で入力してください")
    end

    it "lastnameが35文字の場合、登録できること" do
      address = build(:address, lastname: "a"*35)
      address.valid?
      expect(address).to be_valid
    end

    it "firstnameが空の場合、登録できないこと" do
      address = build(:address, firstname: "")
      address.valid?
      expect(address.errors[:firstname]).to include("を入力してください")
    end

    it "firstnameが36文字以上の場合、登録できないこと" do
      address = build(:address, firstname: "a"*36)
      address.valid?
      expect(address.errors[:firstname]).to include("は35文字以内で入力してください")
    end

    it "firstnameが35文字の場合、登録できること" do
      address = build(:address, firstname: "a"*35)
      address.valid?
      expect(address).to be_valid
    end

    it "lastname_kanaが36文字以上の場合、登録できないこと" do
      address = build(:address, lastname_kana: "ア"*36)
      address.valid?
      expect(address.errors[:lastname_kana]).to include("は35文字以内で入力してください")
    end

    it "lastname_kanaが空の場合、登録できないこと" do
      address = build(:address, lastname_kana: "")
      address.valid?
      expect(address.errors[:lastname_kana]).to include("を入力してください")
    end

    it "lastname_kanaがひらがなの場合、登録できないこと" do
      address = build(:address, lastname_kana: "ああああああ")
      address.valid?
      expect(address.errors[:lastname_kana]).to include("は不正な値です")
    end

    it "lastname_kanaが漢字の場合、登録できないこと" do
      address = build(:address, lastname_kana: "田中")
      address.valid?
      expect(address.errors[:lastname_kana]).to include("は不正な値です")
    end

    it "lastname_kanaがアルファベットの場合、登録できないこと" do
      address = build(:address, lastname_kana: "aaaaaa")
      address.valid?
      expect(address.errors[:lastname_kana]).to include("は不正な値です")
    end

    it "lastname_kanaが35文字の場合、登録できること" do
      address = build(:address, lastname_kana: "ア"*35)
      address.valid?
      expect(address).to be_valid
    end

    it "firstname_kanaが36文字以上の場合、登録できないこと" do
      address = build(:address, firstname: "ア"*36)
      address.valid?
      expect(address.errors[:firstname]).to include("は35文字以内で入力してください")
    end

    it "firstname_kanaが空の場合、登録できないこと" do
      address = build(:address, firstname_kana: "")
      address.valid?
      expect(address.errors[:firstname_kana]).to include("を入力してください")
    end

    it "firstname_kanaがひらがなの場合、登録できないこと" do
      address = build(:address, firstname_kana: "ああああああ")
      address.valid?
      expect(address.errors[:firstname_kana]).to include("は不正な値です")
    end

    it "firstname_kanaが漢字の場合、登録できないこと" do
      address = build(:address, firstname_kana: "田中")
      address.valid?
      expect(address.errors[:firstname_kana]).to include("は不正な値です")
    end

    it "firstname_kanaがアルファベットの場合、登録できないこと" do
      address = build(:address, firstname_kana: "aaaaaa")
      address.valid?
      expect(address.errors[:firstname_kana]).to include("は不正な値です")
    end

    it "firstname_kanaが35文字の場合、登録できること" do
      address = build(:address, firstname: "ア"*35)
      address.valid?
      expect(address).to be_valid
    end

    it "postcodeが空の場合、登録できないこと" do
      address = build(:address, postcode: "")
      address.valid?
      expect(address.errors[:postcode]).to include("を入力してください")
    end

    it "postcodeが3桁-5桁の場合、登録できないこと" do
      address = build(:address, postcode: "111-11111")
      address.valid?
      expect(address.errors[:postcode]).to include("は不正な値です")
    end

    it "postcodeが2桁-4桁の場合、登録できないこと" do
      address = build(:address, postcode: "11-1111")
      address.valid?
      expect(address.errors[:postcode]).to include("は不正な値です")
    end

    it "postcodeが数字以外の場合、登録できないこと" do
      address = build(:address, postcode: "aaa-aaaa")
      expect(address.errors[:postcode]).to include("は不正な値です")
    end

    it "postcodeが3桁-4桁の場合、登録できること" do
      address = build(:address, postcode: "123-4567")
      expect(address).to be_valid
    end

    it "prefecturesが空の場合、登録できないこと" do
      address = build(:address, prefectures: "")
      address.valid?
      expect(address.errors[:prefectures]).to include("を入力してください")
    end

    it "prefecturesがある場合、登録できること" do
      address = build(:address, prefectures: "東京都")
      address.valid?
      expect(address).to be_valid
    end

    it "cityが空の場合、登録できないこと" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "cityが51文字以上の場合、登録できないこと" do
      address = build(:address, city: "a"*51)
      address.valid?
      expect(address.errors[:city]).to include("は50文字以内で入力してください")
    end

    it "cityが35文字の場合、登録できること" do
      address = build(:address, city: "a"*35)
      address.valid?
      expect(address).to be_valid
    end

    it "street_numが空の場合、登録できないこと" do
      address = build(:address, street_num: "")
      address.valid?
      expect(address.errors[:street_num]).to include("を入力してください")
    end

    it "street_numが101文字以上の場合、登録できないこと" do
      address = build(:address, street_num: "a"*101)
      address.valid?
      expect(address.errors[:street_num]).to include("は100文字以内で入力してください")
    end

    it "street_numが100文字の場合、登録できること" do
      address = build(:address, street_num: "a"*100)
      address.valid?
      expect(address).to be_valid
    end

    it "buildingが101文字以上の場合、登録できないこと" do
      address = build(:address, building: "a"*101)
      address.valid?
      expect(address.errors[:building]).to include("は100文字以内で入力してください")
    end

    it "buildingが100文字の場合、登録できること" do
      address = build(:address, building: "a"*100)
      address.valid?
      expect(address).to be_valid
    end
    
    it "home_call_numが101文字以上の場合、登録できないこと" do
      address = build(:address, home_call_num: "1"*101)
      address.valid?
      expect(address.errors[:home_call_num]).to include("は100文字以内で入力してください")
    end

    it "home_call_numが9桁の数字の場合、登録できないこと" do
      address = build(:address, home_call_num: "123456789")
      address.valid?
      expect(address.errors[:home_call_num]).to include("は不正な値です")
    end

    it "home_call_numが12桁の数字の場合、登録できないこと" do
      address = build(:address, home_call_num: "123456789012")
      address.valid?
      expect(address.errors[:home_call_num]).to include("は不正な値です")
    end

    it "home_call_numが数字以外の場合、登録できないこと" do
      address = build(:address, home_call_num: "aiueoaiueo")
      address.valid?
      expect(address.errors[:home_call_num]).to include("は不正な値です")
    end

    it "home_call_numが10桁の数字の場合、登録できること" do
      address = build(:address, home_call_num: "0312345678")
      address.valid?
      expect(address).to be_valid
    end

    it "home_call_numが11桁の数字の場合、登録できること" do
      address = build(:address, home_call_num: "09012345678")
      address.valid?
      expect(address).to be_valid
    end

  end
end