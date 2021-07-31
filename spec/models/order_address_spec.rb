require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @orderaddress = Factory.build(:orderaddress)
  end

  describe '商品購入機能' do
    context '商品購入できるとき'do
      it '全ての項目が正しく入力できていれば、購入できること' do
        expect(@orderaddress).to be_valid
      end

    end
    context '商品購入できないとき'do
      it '全ての項目が正しく入力できていれば、購入できること' do
      end
    end

  end



end
