
## #Photoロケ

![代替テキスト](https://user-images.githubusercontent.com/68630897/99758159-53411500-2b34-11eb-9ea6-8ed6e02c5231.png)

## 概要  
![代替テキスト](https://user-images.githubusercontent.com/68630897/99803230-6e377780-2b7c-11eb-844b-50fc56766d57.gif)

## URL

https://photoroke.com/

※簡単ログイン機能実装時みです

## 使用技術
* Ruby 2.6.5
* Rails 6.0.3.4
* JavaScript
* jQuery
* ajax
* AWS(EC2,S3,MarinaDB,Route53,ACM,ALB)
* RSpec
* FactoryBot
* Nginx 1.18.0（ウェブサーバー）
* Unicorn 5.4.1 （アプリケーションサーバー）
* Git/GitHub
* ruby構文規約チェックツール(rubocop)
* Capistrano 3.14.1



## 機能一覧
* ログイン機能(devise)
* プロフィール編集機能
* 画像投稿機能(ActiveStorage)
* いいね、フォロー機能(ajax)
* コメント機能
* 検索機能
* 緯度経度取得(geocoder)
* Googlemap表示(Google Maps JavaScript API)
* レスポンシブ対応 iPhone
## 工夫点
* UI/UXに力を入れました。ユーザーの方が直感的に利用の仕方がわかるに様々なサイトを参考にしながら作成いたしました。
* Google API を使用したMAPの取得と現在地の取得
* サービスのアイコンを既存のものではなく、Illustratorで作成
## インフラ構成
![代替テキスト](https://user-images.githubusercontent.com/68630897/100490528-53a66500-315f-11eb-9755-63f93e6c7a2d.png)


## 改善、気になっている点
* このアプリのメイン機能である現在地取得がうまく動作しない(11/20 調査中 ~ 11/28 解決)
* 取得した緯度経度をうまく変数で受け渡せていない。(今後gonを使用して改善します）
* 素のJavaScriptがかけていない

## 今後の実装予定
* 緯度経度取得時js⇔rails間で変数を受け渡す(gon)を実装
* CircleCI/CD( Rspec、Rubocop自動化 )

## 制作の背景
写真仲間の友人たちの会話の中で、1番話題に上がるのが**どこでこの写真を撮影した**のか、です。  
しかし、「場所」を共有することは、かなり難しく言葉にしようとすると「駐車場を出たら右手に行って、手前に見える橋を渡って」など、かなり大まかな表現になってしまいます。  
その問題を解決するため、簡単に現在地を共有できるアプリを作成しようと考えました。
