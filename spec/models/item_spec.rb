require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品を出品できるとき' do
      it 'すべての入力項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できないとき' do
      it 'imageが空では出品できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'category_idが[1]では出品できない ' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'item_condition_idが[1]では出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it 'shipping_cost_idが[1]では出品できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it 'prefecture_idが[1]では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を選択してください")
      end
      it 'shipping_date_idが[1]では出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'priceに小数点が含まれると出品できない' do
        @item.price = '1111.111'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は整数で入力してください')
      end
      it 'priceが全角だと出品できない' do
        @item.price = '１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceが300円以下だと出品できない' do
        @item.price = '300'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300より大きい値にしてください')
      end
      it 'priceが9,999,999円以上だと出品できない' do
        @item.price = '9999999'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999より小さい値にしてください')
      end
      it 'userが紐付いてないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
