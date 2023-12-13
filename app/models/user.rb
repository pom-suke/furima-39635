class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英数字の両方を含めて設定してください'
  validates :nickname, presence: true, length: { maximum: 40 }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角かな/カナ/漢字を使用してください'} do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナのみを使用してください'} do
    validates :kana_last_name
    validates :kana_first_name
  end
  validates :birthday, presence: true
end
