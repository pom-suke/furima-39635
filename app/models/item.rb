class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_one :order
  has_one :address, through: :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :pay_shipping
  belongs_to :prefecture
  belongs_to :until_shipping

  with_options presence: true do
    validates :image
    validates :price, numericality: { only_integer: true, in: 300..9_999_999, message: 'には半角数字で300円以上9,999,999円以下を入力してください' }
    validates :product, length: { maximum: 40, message: 'には40文字までしか入力できません' }
    validates :describe, length: { maximum: 1000, message: 'には1000文字までしか入力できません' }
  end

  validates :category_id, :status_id, :pay_shipping_id, :prefecture_id, :until_shipping_id, numericality: { other_than: 1 , message: "can't be blank" }

end
