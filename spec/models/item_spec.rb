require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品が出品できるとき' do
      it '全ての項目が問題なく存在している' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'productが空だと出品できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product can't be blank"
      end
      it 'describeが空だと出品できない' do
        @item.describe = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Describe can't be blank"
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'status_idが空だと出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'pay_shipping_idが空だと出品できない' do
        @item.pay_shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Pay shipping can't be blank"
      end
      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'until_shipping_idが空だと出品できない' do
        @item.until_shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Until shipping can't be blank"
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'status_idが1だと出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'pay_shipping_idが1だと出品できない' do
        @item.pay_shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Pay shipping can't be blank"
      end
      it 'prefecture_idが1だと出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'until_shipping_idが1だと出品できない' do
        @item.until_shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Until shipping can't be blank"
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'priceは全角数字では出品できない' do
        @item.price = '９９９９'
        @item.save
        @item.valid?
        expect(@item.errors.full_messages).to include "Price には半角数字で300円以上9,999,999円以下を入力してください"
      end
      it 'priceが299以下だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price には半角数字で300円以上9,999,999円以下を入力してください"
      end
      it 'priceが10000000以上だと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price には半角数字で300円以上9,999,999円以下を入力してください"
      end
      it 'productが41文字以上だと出品できない' do
        @item.product = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include "Product には40文字までしか入力できません"
      end
      it 'describeが1001文字以上だと出品できない' do
        @item.describe = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include "Describe には1000文字までしか入力できません"
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
