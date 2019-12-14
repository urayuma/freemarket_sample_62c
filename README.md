# メルカリクローンアプリ

TECH::EXPERT でのカリキュラム内で５人のグループ開発で作成しました。

### URL

http://18.177.15.224

## Basic 認証

user: admin
password: password

### 使用技術

Ruby 2.5.1p57
Rails 5.2.3
RSpec
AWS

- EC2
- S3

### 機能一覧

- ユーザ登録(session と devise を用いたページ遷移あり),ログイン機能全般
- facebook/googele での omniauth 認証(ローカル環境のみ)
- 商品出品機能
- 多階層カテゴリー(ancestry)
- 画像のプレビュー機能(jquery)
- 複数画像アップロード(carrierwave)
- 商品購入機能(payjp)
- いいね機能
- 検索機能(ransack)
- ページネーション(kaminari)
- 自動デプロイ(capistrano)

# DB 設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| mail           | string  | null: false |
| password       | string  | null: false |
| lastname       | string  | null: false |
| firstname      | string  | null: false |
| lastname_kana  | string  | null: false |
| firstname_kana | string  | null: false |
| birthday_year  | integer | null: false |
| birthday_month | integer | null: false |
| birthday_day   | integer | null: false |
| phone_number   | string  | null: false |
| image          | string  |             |
| introduction   | text    |             |

### Association

- has_many :chats
- has_one :creditcard
- has_many :orders
- has_many :items
- has_one :address
- has_one:user_information
- has_many :sns_credentials

## creditcards テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user_id  | reference | null: false, foreign_key: true |
| uid      | string    |                                |
| provider | string    |                                |

### Association

- belongs_to :user

## creditcards テーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| user_id     | reference | null: false, foreign_key: true |
| customer_id | string    | null: false                    |
| card_id     | string    | null: false                    |

### Association

- belongs_to :user

## addresses テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| user_id        | reference | null: false, foreign_key: true |
| lastname       | string    | null: false                    |
| firstname      | string    | null: false                    |
| lastname_kana  | string    | null: false                    |
| firstname_kana | string    | null: false                    |
| postcode       | string    | null: false                    |
| prefectures    | string    | null: false                    |
| city           | string    | null: false                    |
| street_num     | string    | null: false                    |
| building       | string    |                                |
| home_call_num  | string    |                                |

### Association

- belongs_to :user

## user_informations テーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| user_id     | reference | null: false, foreign_key: true |
| postcode    | string    |                                |
| prefectures | string    |                                |
| city        | string    |                                |
| street_num  | string    |                                |
| building    | string    |                                |

### Association

- belongs_to :user

## orders テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| item_id | reference | null: false, foreign_key: true |
| user_id | reference | null: false, foreign_key: true |

### Association

- has_one :user_evaluation
- belongs_to :item
- belongs_to :user

## user_evaluations テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| rate     | string    | null: false                    |
| order_id | reference | null: false, foreign_key: true |
| text     | text      |                                |

### Association

- belongs_to :order

## chats テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| user_id | reference | null: false, foreign_key: true |
| item_id | reference | null: false, foreign_key: true |
| text    | text      | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## items テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| name           | string    | null: false                    |
| price          | integer   | null: false                    |
| size           | string    |                                |
| usage_status   | string    | null: false                    |
| descirption    | text      | null: false                    |
| delivery_fee   | string    | null: false                    |
| delivery_way   | string    | null: false                    |
| delivery_area  | string    | null: false                    |
| shipping_date  | string    | null: false                    |
| user_id        | reference | null: false, foreign_key: true |
| brand_id       | integer   |                                |
| category_id    | integer   | null: false                    |
| payment_status | string    | null: false                    |

### Association

- has_many :chats
- belons_to :user
- has_many :likes
- has_many :images
- has_one :brand
- has_one :order
- belongs_to :category

## images テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| image   | string    | null: false                    |
| item_id | reference | null: false, foreign_key: true |

### Association

- belongs_to :item

## likes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## brands テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- belongs_to :item

## categorys テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string | index: true |

### Association

- has_many :items
