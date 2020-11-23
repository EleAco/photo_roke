require 'rails_helper'

RSpec.describe Photo, type: :model do
  before do
    @photo = FactoryBot.build(:photo)
    @photo.image = fixture_file_upload('app/assets/images/photo.jpg')
  end

  describe '新規投稿' do
    context '投稿がうまく行く時' do
      it 'title,imageが存在すれば登録できる' do
        expect(@photo).to be_valid
      end

      it 'titleが20字以内ならば、登録ができる' do
        expect(@photo).to be_valid
      end
    end
  
    context '投稿がうまくいかない時' do
      it 'imgaeが空だと登録できない' do
        @photo.image = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include("写真 は必須です")
      end

      it 'titleが20字以上だと登録できない' do
        @photo.title = 'titleが20字以上だと登録できないことをテストします'
        @photo.valid?
        expect(@photo.errors.full_messages).to include('作品のタイトル名 は20字以内で登録してください。')
      end
    end
  end
end

