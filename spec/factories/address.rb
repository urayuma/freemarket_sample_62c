FactoryBot.define do
  factory :address do
    lastname              { "向井" }
    firstname             { "治" }
    lastname_kana         { "ムカイ" }
    firstname_kana        { "オサム" }
    postcode              { "123-4567" }
    prefectures           { "神奈川" }
    city                  { "横浜市緑区" }
    street_num            { "青山5-1-1" }
    building              { "柳ビル103" }
    home_call_num         { "09000000000" }
    association :user
  end
end
