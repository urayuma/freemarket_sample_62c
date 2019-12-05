class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_one :address
  has_one :user_information
  has_one :creditcard
  has_many :chats
  has_many :orders
  has_many :items
  has_many :likes, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i, message: "は英字と数字両方を含むパスワードを設定してください" }, allow_blank: true # 英字と数字の両方を含む7文字以上128文字以下

  validates :lastname, presence: true
  validates :lastname, length: { maximum: 35 }
  validates :lastname, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-zA-Z]|[ｧ-ﾝﾞﾟ]|[ａ-ｚＡ-Ｚ])+\z/i }, allow_blank: true # 全角ひらがな、全角カタカナ、漢字、半角英字、半角カタカナ、全角英字

  validates :firstname, presence: true, length: { maximum: 35 }
  validates :firstname, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-zA-Z]|[ｧ-ﾝﾞﾟ]|[ａ-ｚＡ-Ｚ])+\z/i }, allow_blank: true # 全角ひらがな、全角カタカナ、漢字、半角英字、半角カタカナ、全角英字

  validates :lastname_kana, presence: true, length: { maximum: 35 }
  validates :lastname_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }, allow_blank: true # カタカナのみ

  validates :firstname_kana, presence: true, length: { maximum: 35 }
  validates :firstname_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }, allow_blank: true # カタカナのみ

  validates :birthday_year, presence: true, numericality: { only_integer: true, greater_than: 1899, less_than: 2020 } # 1900以上2019以下の整数
  validates :birthday_month, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 13 } # 1以上12以下の整数
  validates :birthday_day, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 32 } # 1以上31以下の整数

  validates :phonenumber, presence: true, uniqueness: true
  validates :phonenumber, format: { with: /\A\d{10}$|^\d{11}\z/, message: "登録できません" }, allow_blank: true # 10桁か11桁の数字の文字列
  validates :introduction, length: { maximum: 1000 }

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    user = User.where(email: auth.info.email).first

    # sns_credentialsが登録されている
    # userが登録されていない
    if snscredential.present? && user.blank?
      { user: User.new(
        nickname: auth.info.name,
        email: auth.info.email
      ),
        sns: snscredential }

    # sns_credentialsが登録されていない
    # userが登録されている
    elsif snscredential.blank? && user.present?
      { user: user,
        sns: SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        ) }

    # sns_credentialsが登録されていない
    # userが登録されていない
    else
      { user: User.new(
        nickname: auth.info.name,
        email: auth.info.email
      ),
        sns: SnsCredential.new(
          uid: uid,
          provider: provider
        ) }
    end
  end
end
