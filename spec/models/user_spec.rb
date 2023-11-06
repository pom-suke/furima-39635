require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe "ユーザー新規登録" do
    context '新規登録ができるとき' do
      it '全ての項目が問題なく存在している' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana last name can't be blank"
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first name can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'test02'
        @user.password_confirmation = 'test03'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'nicknameが40文字以上では登録できない' do
        @user.nickname = 'pomPOMぽんポンpomsukeぽんすけポンスケpomchanPOMCHANぽんちゃんポンチャン'
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname is too long (maximum is 40 characters)"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too long (maximum is 128 characters)"
      end
      it '重複したemailが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'samplesample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には半角英数字の両方を含めて設定してください"
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には半角英数字の両方を含めて設定してください"
      end
      it 'passwordは全角文字を含めては登録できない' do
        @user.password = 'Ｔest01'
        @user.password_confirmation = 'Ｔest01'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には半角英数字の両方を含めて設定してください"
      end
      it 'last_nameは全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.last_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角かな/カナ/漢字を使用してください"
      end
      it 'first_nameは全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.first_name = 'kouta'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角かな/カナ/漢字を使用してください"
      end
      it 'kana_last_nameは全角カタカナでないと登録できない' do
        @user.kana_last_name = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana last name 全角カナのみを使用してください"
      end
      it 'kana_first_nameは全角カタカナでないと登録できない' do
        @user.kana_first_name = 'こうた'
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first name 全角カナのみを使用してください"
      end
    end
  end
end
