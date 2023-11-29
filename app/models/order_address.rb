class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id, :order_date, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを含めた半角数字で入力してください" }
    validates :city
    validates :house_number
    validates :order_id
    validates :order_date
    validates :user_id
    validates :item_id
  end
  validates :phone_number, length: { in: 10..11 }, numericality: { only_integer: true, message: "は半角数字のみで入力してください" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }

  def save
    order = Order.create(order_date: order_date, user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end