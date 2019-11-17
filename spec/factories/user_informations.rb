FactoryBot.define do
  factory :user_information do
    postcode      { "1234567" }
    prefectures   { "東京都" }
    city          { "足立区安達町" }
    street_num    { "1丁目2番地3号" }
    building      { "アダチビル" }
    association :user
  end
end
