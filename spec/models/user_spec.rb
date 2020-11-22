require 'rails_helper'

RSpec.describe User, type: :model do
  before do
   @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規機能' do
    context '新規登録がうまく行く時' do
      it 'nickname,email,password,password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'emailに@が含まれれば登録できる' do
        expect(@user).to be_valid
      end
      
      it 'passwordが6文字以上で英数字を含めば登録できる' do
        @user.password = 'test1234'
        @user.password_confirmation = 'test1234'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネーム が入力されていません。")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレス が入力されていません。")
      end

      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'gmailgmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレス は有効でありません。')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレス は既に使用されています。')
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード が入力されていません。")
      end

      it 'passwordが6文字以下だと登録できない' do
        @user.password = 'te12'
        @user.password_confirmation = 'te12'
        @user.valid? 
        expect(@user.errors.full_messages).to include('パスワード は6文字以上に設定して下さい。)')
      end

      it 'passwordに英数字両方含まれていないと登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード は英字と数字の両方を含めて設定してください。")
      end

      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
