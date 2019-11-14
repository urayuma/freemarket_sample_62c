class Address < ApplicationRecord
  belongs_to :user

  validates :lastname, presence: true, length:{ maximum: 35 }
  validates :firstname, presence: true, length:{ maximum: 35 }
  validates :lastname_kana, presence: true, length:{ maximum: 35 }, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/} #カタカナのみ
  validates :firstname_kana, presence: true, length:{ maximum: 35 }, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :postcode, presence: true, format: { with:/\A\d{3}[-]\d{4}\z/} #3桁の数字の後「-」が入り、4桁の数字が続く
  validates :prefectures, presence: true
  validates :city, presence: true, length:{ maximum: 50 }
  validates :street_num, presence: true, length:{ maximum: 100 }
  validates :building, length:{ maximum: 100 }
  validates :home_call_num, length:{ maximum: 100 }, uniqueness: true, format: { with: /\A\d{10}$|^\d{11}\z/ } #10桁か11桁の数字の文字列
end






