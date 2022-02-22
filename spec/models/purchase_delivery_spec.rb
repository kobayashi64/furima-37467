require 'rails_helper'

RSpec.describe :purchase_delivery, type: :model do
  before do
    @purchase_delivery = FactoryBot.build(:purchase_delivery)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it 'post_code、prefecture_id、city、address、telephone_number、token、user_id,item_idが存在すれば購入できる' do
        expect(@purchase_delivery).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'item_idが空では購入できない' do
        @purchase_delivery.item_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空では購入できない' do
        @purchase_delivery.user_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では登録できない' do
        @purchase_delivery.token = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空では登録できない' do
        @purchase_delivery.post_code = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが3桁ハイフン4桁でないと登録できない' do
        @purchase_delivery.post_code = '1234-567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Post code 「3桁ハイフン4桁」の半角で入力してください')
      end

      it 'prefecture_idが空では登録できない' do
        @purchase_delivery.prefecture_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが「---」では登録できない' do
        @purchase_delivery.prefecture_id = '1'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Prefecture 項目に「---」以外を選択してください')
      end

      it 'addressが空では登録できない' do
        @purchase_delivery.address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephone_numberが空では登録できない' do
        @purchase_delivery.telephone_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'telephone_numberが半角英字では登録できない' do
        @purchase_delivery.telephone_number = 'abcdefghij'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Telephone number 10桁以上11桁以内の半角数値で入力してください')
      end

      it 'telephone_numberが全角数字では登録できない' do
        @purchase_delivery.telephone_number = '１２３４５６７８９０'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Telephone number 10桁以上11桁以内の半角数値で入力してください')
      end

      it 'telephone_numberが9桁以下では登録できない' do
        @purchase_delivery.telephone_number = '123456789'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Telephone number 10桁以上11桁以内の半角数値で入力してください')
      end

      it 'telephone_numberが12桁以上では登録できない' do
        @purchase_delivery.telephone_number = '123456789012'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Telephone number 10桁以上11桁以内の半角数値で入力してください')
      end
    end
  end
end
