require 'rails_helper'
describe UserInformation do
  describe '#create' do
    it "user_idがnilの場合、登録できないこと" do
      user_information = build(:user_information, user_id: nil)
      user_information.valid?
      expect(user_information.errors[:user]).to include("を入力してください")
    end

    it "user_idが既にある場合、登録できないこと" do
      user = create(:user)
      create(:user_information, user_id: user.id)
      user_information_another = build(:user_information, user_id: user.id)
      user_information_another.valid?
      expect(user_information_another.errors[:user_id]).to include("はすでに存在します")
    end

    it "user_idがある場合、登録できること" do
      user = create(:user)
      user_information = build(:user_information, user_id: user.id)
      expect(user_information).to be_valid
    end

    it "postcodeが数字以外を含む場合、登録できないこと" do
      user = create(:user)
      user_information = build(:user_information, postcode: "aiueoai", user_id: user.id)
      user_information.valid?
      expect(user_information.errors[:postcode]).to include("フォーマットが不適切です")
    end

    it "postcodeが8桁の数字の場合、登録できないこと" do
      user = create(:user)
      user_information = build(:user_information, postcode: "12345678", user_id: user.id)
      user_information.valid?
      expect(user_information.errors[:postcode]).to include("フォーマットが不適切です")
    end

    it "postcodeが7桁の数字の場合、登録できること" do
      user = create(:user)
      user_information = build(:user_information, postcode: "1234567", user_id: user.id)
      expect(user_information).to be_valid
    end

    it "postcodeが空の場合、登録できること" do
      user = create(:user)
      user_information = build(:user_information, postcode: "", user_id: user.id)
      expect(user_information).to be_valid
    end

    it "prefecturesがある場合、登録できること" do
      user = create(:user)
      user_information = build(:user_information, prefectures: "北海道", user_id: user.id)
      expect(user_information).to be_valid
    end

    it "prefecturesが空の場合、登録できること" do
      user = create(:user)
      user_information = build(:user_information, prefectures: "", user_id: user.id)
      expect(user_information).to be_valid
    end

    it "cityが51文字以上の場合、登録できないこと" do
      user = create(:user)
      city = (0...51).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で51文字の文字列
      user_information = build(:user_information, city: city.to_s, user_id: user.id)
      user_information.valid?
      expect(user_information.errors[:city]).to include("は50文字以内で入力してください")
    end

    it "cityが50文字以下の場合、登録できること" do
      user = create(:user)
      city = (0...50).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で50文字の文字列
      user_information = build(:user_information, city: city.to_s, user_id: user.id)
      expect(user_information).to be_valid
    end

    it "cityが空の場合、登録できること" do
      user = create(:user)
      user_information = build(:user_information, city: "", user_id: user.id)
      expect(user_information).to be_valid
    end

    it "street_numが101文字以上の場合、登録できないこと" do
      user = create(:user)
      street_num = (0...101).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で101文字の文字列
      user_information = build(:user_information, street_num: street_num.to_s, user_id: user.id)
      user_information.valid?
      expect(user_information.errors[:street_num]).to include("は100文字以内で入力してください")
    end

    it "street_numが100文字以下の場合、登録できること" do
      user = create(:user)
      street_num = (0...100).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で100文字の文字列
      user_information = build(:user_information, street_num: street_num.to_s, user_id: user.id)
      expect(user_information).to be_valid
    end

    it "street_numが空の場合、登録できること" do
      user = create(:user)
      user_information = build(:user_information, street_num: "", user_id: user.id)
      expect(user_information).to be_valid
    end

    it "buildingが101文字以上の場合、登録できないこと" do
      user = create(:user)
      building = (0...101).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で101文字の文字列
      user_information = build(:user_information, building: building.to_s, user_id: user.id)
      user_information.valid?
      expect(user_information.errors[:building]).to include("は100文字以内で入力してください")
    end

    it "buildingが100文字以下の場合、登録できること" do
      user = create(:user)
      building = (0...100).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で100文字の文字列
      user_information = build(:user_information, building: building.to_s, user_id: user.id)
      expect(user_information).to be_valid
    end

    it "buildingが空の場合、登録できること" do
      user = create(:user)
      user_information = build(:user_information, building: "", user_id: user.id)
      expect(user_information).to be_valid
    end
  end
end
