require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe "商品購入機能" do
    context '商品が購入できるとき' do
      it '全ての項目が問題なく存在している' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'post_codeが空だと購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code can't be blank"
      end
      it 'prefecture_idが空だと購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空だと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'house_numberが空だと購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'tokenが空だと購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'userが紐づいていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐づいていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'post_codeは「3桁ハイフン4桁」の半角文字列のみで入力しないと購入できない' do
        # ハイフンがない場合
        @order_address.post_code = '1239876'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code はハイフンを含めた半角数字で入力してください"

        # ハイフンの位置が異なる場合
        @order_address.post_code = '1239-876'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code はハイフンを含めた半角数字で入力してください"

        # 文字数が足りない場合
        @order_address.post_code = '12-9876'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code はハイフンを含めた半角数字で入力してください"

        # 文字数が多い場合
        @order_address.post_code = '123-98765'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code はハイフンを含めた半角数字で入力してください"

        # 数字以外が含まれている場合
        @order_address.post_code = '12O-9876'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code はハイフンを含めた半角数字で入力してください"
      end
      it 'phone_numberは9ケタ以下だと購入できない' do
        @order_address.phone_number = '090987654'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number は10から11桁の半角数字のみで入力してください"
      end
      it 'phone_numberは12ケタ以上だと購入できない' do
        @order_address.phone_number = '090987654321'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number は10から11桁の半角数字のみで入力してください"
      end
      it 'phone_numberはハイフンがあると購入できない' do
        @order_address.phone_number = '090-9876-5432'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number は10から11桁の半角数字のみで入力してください"
      end
      it 'prefecture_idが1だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
    end
  end
end
