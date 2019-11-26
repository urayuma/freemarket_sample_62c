class Item < ApplicationRecord
  has_many :chats
  belongs_to :user
  has_many :likes
  has_many :images
  belongs_to :brand
  has_one :order
  belongs_to :category
end
