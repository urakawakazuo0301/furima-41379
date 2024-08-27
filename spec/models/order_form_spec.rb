require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品の購入' do
    context '商品を購入できるとき' do
      it 'すべての入力項目が存在すれば購入できる' do
        expect(@order_form).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it 'user_idが空では購入できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Itemを入力してください")
      end
      it 'postcodeが空では購入できない' do
        @order_form.postcode = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'postcodeにハイフンがないと購入できない' do
        @order_form.postcode = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('郵便番号は無効です。次のように入力してください (例: 123-4567)')
      end
      it 'prefecture_idが[1]では購入できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空では購入できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'blockが空では購入できない' do
        @order_form.block = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberにハイフンがあると購入できない' do
        @order_form.phone_number = '012-3456-7890'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('電話番号は無効です。数字のみ入力してください')
      end
      it 'phone_numberが12桁以上あると購入できない' do
        @order_form.phone_number = '012345678900'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('電話番号は無効です。数字のみ入力してください')
      end
      it 'tokenが空では購入できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'phone_numbeが9桁以下では購入できない'  do
        @order_form.phone_number = '012345678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は無効です。数字のみ入力してください")
      end
    end
  end
end