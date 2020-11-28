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

      it 'explanationが500文字以内なら登録できる' do
        expect(@photo).to be_valid
      end
    end

    context '投稿がうまくいかない時' do
      it 'imgaeが空だと登録できない' do
        @photo.image = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include('写真 は必須です')
      end

      it 'titleが20字以上だと登録できない' do
        @photo.title = 'titleが20字以上だと登録できないことをテストします'
        @photo.valid?
        expect(@photo.errors.full_messages).to include('作品のタイトル名 は20字以内で登録してください。')
      end

      it 'explanationが500文字以上だと登録できない' do
        @photo.explanation = '私はコミュニケーション能力の高さがウリです。子供のころから人見知りで引込み思案でしたが大学入学後すぐ友達になった女性にもてる同級生に誘われ女性をナンパしに行きましたが美男子の友人ばかりがモテて、悔しい思いをしました。容姿ではかなわない私が友人に勝つためにはと考えたのが相手を引き付ける会話術でした。いかに相手を楽しくさせて容易にコミュニケーションをとり懐に入り込み親しくなることでナンパを成功させるというのが考えでした。とにかく多くの女性に声をかけ経験を積み自分の会話スタイルを構築し友人をしのぐ成功率になるまでにブラッシュアップしました。これは自分を変えるターニングポイントになり幼いころからの人見知りがなくなり、何事にも積極的に前に出ていけるようになり引っ込み思案をも改善されました。またこの成功体験があり自分に不足していた負けん気も養うことができたと考えます。このことで色々な人と関わることがスムーズになり自分が伝えたいことや、自分の要求を理解、共感させることや交渉事が得意なことになりました。この私の特技は御社においての営業職等の折衝事を必要とされるような職務に活かされると自負いたします。500文字以上になります。'
        @photo.valid?
        expect(@photo.errors.full_messages).to include('説明文 は500文字以内で登録してください。')
      end
    end
  end
end
