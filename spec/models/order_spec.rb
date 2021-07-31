require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '商品購入できるとき'do
      it '全ての項目が正しく入力できていれば、購入できること' do
        expect(@order).to be_valid
      end

    end
    context '商品購入できないとき'do
      it '郵便番号がないと購入できない' do
      end

      it'都道府県の記入がないと購入できない'do
      end

      it'市区町村の記入がないと購入できない'do
      end

      it'番地の記入がないと購入できない'do
      end

      it'電話番号の記入がないと購入できない'do
      end

      it'郵便番号にハイフンがないと購入できない'do
      end

      it'電話番号は11桁出ないと購入できない'do
      end

      it'クレジットカード情報がないと購入できない'do
      end

    end

  end



end
