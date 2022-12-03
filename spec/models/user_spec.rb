require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'name, email, passwordとpassword_confirmation, が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '登録できないとき' do
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345689'
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end
    end
  end
end
