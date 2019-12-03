FactoryBot.define do
  factory :item do
    id                    { 1 }
    name                  { "大粒ラムネ" }
    price                 { 1200 }
    usage_status          { "中古" }
    description           { "良き" }
    brand_id              { "1" }
    category_id           { "198" }
    selling_status        { "出品中" }
    delivery_fee          { "100" }
    delivery_way          { "普通郵便" }
    delivery_area         { "神奈川" }
    shipping_date         { "20191230" }
    payment_status        { "未払い" }
    size                  { "L" }
    association :user
    association :brand
    association :category
  end
end
