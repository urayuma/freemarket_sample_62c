class Item < ApplicationRecord
  has_many :chats, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :brand
  has_one :order
  belongs_to :category
end
