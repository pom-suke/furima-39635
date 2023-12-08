class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  has_one :address

  def self.sold?(item_id)
    Order.exists?(item_id: item_id)
  end
end
