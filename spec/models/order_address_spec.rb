require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @orderaddress = FactoryBot.build(:order_address)
    @user = FactoryBot.build(:user)
  end

  describe '商品購入機能' do
    context '商品購入できるとき'do
      it '全ての項目が正しく入力できていれば、購入できること' do
        expect(@orderaddress).to be_valid
      end

      it '建物の入力がなくても購入できる'do
        @orderaddress.building = ""
        expect(@orderaddress).to be_valid
      end

    end
    context '商品購入できないとき'do
      it '郵便番号がないと購入できない' do
        @orderaddress.postal_code = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Postal code can't be blank")
      end

      it'都道府県の記入がないと購入できない'do
        @orderaddress.prefecture_id = 1
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it'市区町村の記入がないと購入できない'do
        @orderaddress.city = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("City can't be blank")
      end

      it "市区町村のデータがないと購入できない"do
        @orderaddress.city = nil
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("City can't be blank")
      end

      it'番地の記入がないと購入できない'do
        @orderaddress.house_number = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("House number can't be blank")
      end

      it'電話番号の記入がないと購入できない'do
        @orderaddress.phone_number = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number can't be blank")
      end

   
      it '出品者がいないと購入できない' do
        @orderaddress.user_id= ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("User can't be blank")
      end

      it '商品がないと購入できない' do
        @orderaddress.item_id = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Item can't be blank")
      end

      it'郵便番号にハイフンがないと購入できない'do
        @orderaddress.postal_code = "1234567"
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Postal code is invalid")
      end

      it'電話番号は11桁出ないと購入できない'do
        @orderaddress.phone_number = "0000"
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number is the wrong length (should be 11 characters)")
      end

      it'電話番号が12桁以上では購入できない'do
        @orderaddress.phone_number = "12345676891011"
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number is the wrong length (should be 11 characters)")
      end

      it'電話番号は数字でないと購入できない'do
        @orderaddress.phone_number = "あいうえおかきくけこさ"
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number is not a number")
      end

      it'クレジットカード情報がないと購入できない'do
        @orderaddress.token = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Token can't be blank")
      end


    end

  end



end
