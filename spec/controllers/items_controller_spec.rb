require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe "get #show" do
    it 'get #show' do
      get :show, params: { id: item.id }
      expect(response.status).to eq(200)
    end
  end

  describe '商品表示' do
    it '商品の名前' do
      item_params = attributes_for(:item)
      expect(item.name).to eq "大粒ラムネ"
    end
    it '商品の有無' do
      item_params = attributes_for(:item)
      expect(item.selling_status).to eq "出品中"
    end
    it '出品者' do
      item_params = attributes_for(:item)
      expect(item.user.nickname).to eq "tanegashiman"
    end
    it 'ブランド' do
      item_params = attributes_for(:item)
      expect(item.brand.name).to eq "森永"
    end
    it 'サイズ' do
      item_params = attributes_for(:item)
      expect(item.size).to eq "L"
    end
    it '商品の状態' do
      item_params = attributes_for(:item)
      expect(item.usage_status).to eq "中古"
    end
    it '配送料の負担' do
      item_params = attributes_for(:item)
      expect(item.delivery_fee).to eq "100"
    end
    it '配送の方法' do
      item_params = attributes_for(:item)
      expect(item.delivery_way).to eq "普通郵便"
    end
    it '配送元地域' do
      item_params = attributes_for(:item)
      expect(item.delivery_area).to eq "神奈川"
    end
    it '発送日の目安' do
      item_params = attributes_for(:item)
      expect(item.shipping_date).to eq "20191230"
    end
    it '商品の価格' do
      item_params = attributes_for(:item)
      expect(item.price).to eq 1200
    end
    it '商品の紹介' do
      item_params = attributes_for(:item)
      expect(item.description).to eq "良き"
    end
  end
end
