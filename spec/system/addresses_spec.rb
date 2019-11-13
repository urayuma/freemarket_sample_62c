require 'rails_helper'

RSpec.describe "Addresses", type: :system do
  let(:user) { create(:user) }
  before do
    driven_by(:rack_test)
  end

  scenario 'ログイン済みユーザは送付先住所登録できる' do
    sign_in user
    visit addresses_path
    expect(page).to have_content '住所入力'

    expect do
      fill_in 'user_lastname', with: '向井'
      fill_in 'user_firstname', with: '治'
      fill_in 'user_lastname_kana', with: 'ムカイ'
      fill_in 'user_firstname_kana', with: 'オサム'
      fill_in 'address_postcode', with: '123-4567'
      select '神奈川', from: 'address_prefectures'
      fill_in 'address_city', with: '横浜市緑区'
      fill_in 'address_street_num', with: '青山5-1-1'
      fill_in 'address_building', with: 'エスポワール号45'
      fill_in 'address_home_call_num', with: '09012345678'
      click_button '次へ進む'
    end.to change { Address.count }.by(1)
  end
end
