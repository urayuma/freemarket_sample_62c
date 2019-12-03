class Item < ApplicationRecord
  has_many :chats, dependent: :destroy
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :brand, optional: true
  has_one :order
  belongs_to :category, optional: true
  accepts_nested_attributes_for :images
end
