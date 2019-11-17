# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false|
|password|string|null: false|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|phone_number|string|null: false|
|image|string||
|introduction|text||

### Association
- has_many :chats
- has_one :creditcard
- has_many :orders
- has_many :items
- has_one :address
- has_one:user_information

## creditcardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|postcode|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|street_num|string|null: false|
|building|string||
|home_call_num|string||

### Association
- belongs_to :user

## user_informationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|postcode|string||
|prefectures|string||
|city|string||
|street_num|string||
|building|string||

### Association
- belongs_to :user

## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

### Association
- has_one :user_evaluation
- belongs_to :item 
- belongs_to :user

## user_evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|rate|string|null: false|
|order_id|reference|null: false, foreign_key: true|
|text|text||

### Association
- belongs_to :order 

## chatsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :item 

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|size|string||
|usage_status|string|null: false|
|descirption|text|null: false|
|delivery_fee|string|null: false|
|delivery_way|string|null: false|
|delivery_area|string|null: false|
|shipping_date|string|null: false|
|user_id|reference|null: false, foreign_key: true|
|brand_id|integer||
|category_id|integer|null: false|
|payment_status|string|null: false|

### Association
- has_many :chats
- belons_to :user
- has_many :likes
- has_many :images
- has_one :brand
- has_one :order 
- belongs_to :category

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :item 

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item 

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :item 

## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|

### Association
- has_many :items