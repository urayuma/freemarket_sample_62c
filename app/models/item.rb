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

  validates :user_id, presence: true, uniqueness: true
  validates :image, presence: true
  validates :name, presence: true, inclusion: { in: 1..40, message: "入力してください" }
  validates :description, presence: true, inclusion: { in: 1..1000, message: "入力してください" }
  validates :category_id, presence: true
  validates :size, presence: true
  validates :usage_status, presence: true
  validates :delivery_fee, presence: true
  validates :delivery_way, presence: true
  validates :delivery_area, presence: true
  validates :shipping_date, presence: true
  validates :price, presence: true, inclusion: { in: 300..9999999, message: "入力してください"}, numericality: { only_integer: true }

end
