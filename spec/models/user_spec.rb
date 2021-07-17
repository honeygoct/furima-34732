require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context 'ユーザーが登録できる場合' do
      it 'すべての値が正しければ登録できる'do
      expect(@user).to be_valid
      end
    end
    context 'ユーザーが登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない'do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@がない場合登録できない'do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end


      it 'passwordが空では登録できない'do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは、半角英数字混合でないと登録できない(英字のみ)'do
        @user.password = 'asdzxc'
        @user.password_confirmation = 'asdzxc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角で英字と数字の両方を含めて設定してください')
      end

      it 'passwordは、半角英数字混合でないと登録できない(数字のみ)'do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角で英字と数字の両方を含めて設定してください')
      end

      it 'passwordは全角英数混合では登録できないこと(ａａＡ１１１など)'do
      @user.password = 'ａａＡ１１１'
      @user.password_confirmation = 'ａａＡ１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には半角で英字と数字の両方を含めて設定してください')
      end

      it 'password_confirmationが空だと登録できない'do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

      end

      it 'passwordとpassword_confirmationが同じでないと登録できない'do
        @user.password = '890iop'
        @user.password_confirmation = '123qwe'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end


      it 'passwordが5文字以下では登録できない'do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
    end
  end

  describe '新規登録/本人情報確認' do

    it 'last_nameが空では登録できない'do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できない'do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kaneが空では登録できない'do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できない'do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'last_nameが全角文字でなければ登録できない'do
      @user.last_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name には全角文字を使用してください')
    end

    it 'first_nameが全角文字でなければ登録できない'do
      @user.first_name = 'huga'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name には全角文字を使用してください')
    end

    it 'last_name_kanaが全角文字でなければ登録できない'do
      @user.last_name_kana = 'あああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana には全角カタカナを使用してください')
    end

    it 'first_name_kanaが全角カタカナでなければ登録できない' do
      @user.first_name_kana = 'ｱｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana には全角カタカナを使用してください')
    end

    it 'birthdayが空では入力できない'do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end





