class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :pay_shipping
  belongs_to :prefecture
  belongs_to :until_shipping

  validates :product, :describe, presence: true

  validates :category_id, :status_id, :pay_shipping_id, :prefecture_id, :until_shipping_id, numericality: { other_than: 1 , message: "can't be blank" }

end
