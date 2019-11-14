require 'rails_helper'

RSpec.describe 'Users', type: :system do

  scenario 'ユーザ登録することができる' do
    visit step1_signups_path
    expect(page).to have_content '会員情報入力'

    fill_in 'nickname', with: 'test'
    fill_in 'email', with: 'kkk@gmail.com'
    fill_in 'password', with: '123456a'
    fill_in 'lastname', with: '向井'
    fill_in 'firstname', with: '治'
    fill_in 'lastname_kana', with: 'ムカイ'
    fill_in 'firstname_kana', with: 'オサム'
    select 1998, from: 'user_birthday_year'
    select 12, from: 'user_birthday_month'
    select 31, from: 'user_birthday_day'
    click_button '次に進む'
    
  end
end