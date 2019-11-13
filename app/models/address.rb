class Address < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true
  validates :lastname, presence: true, length: { maximum: 35 }
  validates :firstname, presence: true, length: { maximum: 35 }
  validates :lastname_kana, presence: true, length: { maximum: 35 }
  validates :lastname_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナ以外は使用できません" }, allow_blank: true # カタカナのみ
  validates :firstname_kana, presence: true, length: { maximum: 35 }
  validates :firstname_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナ以外は使用できません" }, allow_blank: true
  validates :postcode, presence: true
  validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: "フォーマットが不適切です" }, allow_blank: true # 3桁の数字の後「-」が入り、4桁の数字が続く
  validates :prefectures, presence: true
  validates :city, presence: true, length: { maximum: 50 }
  validates :street_num, presence: true, length: { maximum: 100 }
  validates :building, length: { maximum: 100 }
  validates :home_call_num, length: { maximum: 100 }
  validates :home_call_num, uniqueness: true, format: { with: /\A\d{10}$|^\d{11}\z/, message: "は10~11桁の数字を入力してください" }, allow_blank: true # 10桁か11桁の数字の文字列
end
