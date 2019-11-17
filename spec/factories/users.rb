FactoryBot.define do
  factory :user do
    nickname              { "tanegashiman" }
    email                 { "kkk@gmail.com" }
    password              { "123456a" }
    lastname              { "向井" }
    firstname             { "治" }
    lastname_kana         { "ムカイ" }
    firstname_kana        { "オサム" }
    birthday_year         { 2018 }
    birthday_month        { 12 }
    birthday_day          { 31 }
    phonenumber           { "09000000000" }
  end
end
