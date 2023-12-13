class ChangeDatatypePhoneNumberOfAdresses < ActiveRecord::Migration[7.0]
  def change
    change_column :addresses, :phone_number, :string
  end
end
