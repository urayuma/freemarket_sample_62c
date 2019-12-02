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
