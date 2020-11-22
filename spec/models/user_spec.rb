require 'rails_helper'

RSpec.describe User, type: :model do
  before do
   @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規機能' do
    context '新規登録がうまく行く時' do
      it 'nickname,email,password,password_confirmationが存在すれば登録できる' do
        ecpect(@user).to be_valid
      end
    end
  end
end
