require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規出品機能' do
    context '新規出品できる場合' do
      it 'image、product_name、description、price、category_id、condition_id 、delivery_charge_id、prefecture_id、days_to_ship_id、user_idが存在すれば登録できる' do
        expect(@item.user).to be_valid
      end
    end
    context '新規出品できない場合' do
      it "userが紐付いていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "product_nameが空では登録できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "descriptionが空では登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
  
      it "category_idが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
  
      it "condition_idが空では登録できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "delivery_charge_idが空では登録できない" do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "days_to_ship_idが空では登録できない" do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it "category_idが「---」では登録できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category 項目に「---」以外を選択してください")
      end
  
      it "condition_idが「---」では登録できない" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition 項目に「---」以外を選択してください")
      end

      it "delivery_charge_idが「---」では登録できない" do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge 項目に「---」以外を選択してください")
      end

      it "prefecture_idが「---」では登録できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture 項目に「---」以外を選択してください")
      end

      it "days_to_ship_idが「---」では登録できない" do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship 項目に「---」以外を選択してください")
      end

        it "priceが9999999以上だと登録できない" do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price 300~9999999円の間で入力してください")
       end

        it "priceが299以下だと登録できない" do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price 300~9999999円の間で入力してください")
       end
       
        it "priceが半角英字では登録できない" do
          @item.price = 'taro'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price 半角数字を使用してください")
      end

        it 'priceが半角英字が含まれていると登録できない"' do
            @item.price = '1111aa'
            @item.valid?
            expect(@item.errors.full_messages).to include('Price 半角数字を使用してください')
      end
    
        it ' priceが全角数字では登録できない' do
            @item.price = '１１１１'
            @item.valid?
            expect(@item.errors.full_messages).to include('Price 半角数字を使用してください')
          end
         end
        end
      end