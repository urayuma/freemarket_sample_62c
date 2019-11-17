class UserInformation < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true, uniqueness: true
  validates :postcode, allow_blank: true, format: { with: /\A\d{7}\z/, message: "フォーマットが不適切です" }
  validates :city, length: { maximum: 50 }
  validates :street_num, length: { maximum: 100 }
  validates :building, length: { maximum: 100 }
end
