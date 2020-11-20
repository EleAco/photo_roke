
## #Photoロケ

![代替テキスト](https://user-images.githubusercontent.com/68630897/99758159-53411500-2b34-11eb-9ea6-8ed6e02c5231.png)

## 概要  
![代替テキスト](https://user-images.githubusercontent.com/68630897/99803230-6e377780-2b7c-11eb-844b-50fc56766d57.gif)

## URL

http://54.248.19.145/

※簡単ログイン機能実装時みです

## 使用技術
* Ruby 2.6.5
* Rails 6.0.3.4
* JavaScript
* jQuery
* ajax
* AWS(EC2,S3,MarinaDB)


## 機能一覧
* ログイン機能(devise)
* 画像投稿機能
* いいね、フォロー機能(ajax)
* コメント機能
* 検索機能
* 緯度経度取得(geocoder)
* Googlemap表示(Google Maps JavaScript API)
* ruby構文規約チェックツール(rubocop)
## 工夫点
* UI/UXに力を入れました。ユーザーの方が直感的に利用の仕方がわかるに様々なサイトを参考にしながら作成いたしました。
* Google API を使用したMAPの取得と現在地の取得
* サービスのアイコンを既存のものではなく、Illustratorで作成
## インフラ構成
![代替テキスト](https://user-images.githubusercontent.com/68630897/99748650-43b7d100-2b20-11eb-8b4e-7e124568a0b2.png)


## 改善、気になっている点
* レスポンシブ対応していない
* このアプリのメイン機能である現在地取得がうまく動作しない(11/20 調査中)
* HTTPS化ができていない （インフラが弱い)
* 素のJavaScriptがかけていない

## 今後の実装予定
* Rspecを使用したテストの記述
* AWS Certificate Manager を使用した証明書の取得
* Amazon Route 5S を使用したドメインの取得・管理
* Elastic Load Balancing の実装

## 制作の背景
写真仲間の友人たちの会話の中で、1番話題に上がるのが**どこでこの写真を撮影した**のか、です。  
しかし、「場所」を共有することは、かなり難しく言葉にしようとすると「駐車場を出たら右手に行って、手前に見える橋を渡って」など、かなり大まかな表現になってしまいます。  
その問題を解決するため、簡単に現在地を共有できるアプリを作成しようと考えました。
