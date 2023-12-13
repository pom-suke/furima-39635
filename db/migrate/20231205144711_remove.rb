class Remove < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :order_date, :datetime
  end
end
