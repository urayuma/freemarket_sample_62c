class Item < ApplicationRecord
  has_many :chats, dependent: :destroy
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :brand, optional: true
  has_one :order
  belongs_to :category, optional: true
  accepts_nested_attributes_for :images

  ransacker :likes_count do
    query = '(SELECT COUNT(likes.item_id) FROM likes where likes.item_id = items.id GROUP BY likes.item_id)'
    Arel.sql(query)
  end
end


  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum:1, maximum: 40, message: "入力してください" }
  validates :description, presence: true, length: { minimum: 1,maximum: 1000, message: "入力してください" }
  validates :category_id, presence: true
  validates :usage_status, presence: true
  validates :delivery_fee, presence: true
  validates :delivery_way, presence: true
  validates :delivery_area, presence: true
  validates :shipping_date, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, message: "入力してください"}, numericality: { only_integer: true }

end
