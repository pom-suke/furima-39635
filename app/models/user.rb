class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :nickname, presence: true, length: { maximum: 40 }
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }, presence: true
  validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :birthday, presence: true
end
