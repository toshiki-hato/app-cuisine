# README

## アプリ名

cuisine<br>


https://gyazo.com/ef55bea7e80302c8c634451ae9fd4f09 <br>

## App URL

https://cui-port.herokuapp.com/ <br>

ユーザー名/ sample<br>
Eメール/ sample@sample.com<br>
パスワード/ 55113334<br>
新規登録も可能ですがこちらをご利用頂けたら幸いです。<br>

##  概要

本アプリケーションは料理の作った画像を投稿し共有するサービスです。<br>

開発目的は作った料理を共有することです。<br>

一人暮らしを始められた方が自炊を試みたが料理のネタがなくなった時に使用して欲しいと思い、こちらを作成しました。<br>



##  使用方法

①上記のテスト用ユーザーでログイン<br>
※ログインできない場合は新規で登録ください。

##  課題や今後実装したい機能

カレンダー機能を追加し投稿した記事をカレンダーの予定に追加できるようにしたい。<br>
料理動画投稿機能の追加<br>


## 工夫したポイント

※投稿フォームで画像をアップロードする上でCarrierWaveを使用した。<br>
デプロイの際にherokuのストレージだけでは画像の保存が少量しかできない為、
AWSのS3を使用した。<br>

※いいね機能を実装、いいねの数の多い順(上位３位)をランキング表示させました。<br>

※投稿詳細内にメッセージ機能を入れましたがAjaxを用いて非同期通信を行いました。<br>

## 使用技術(開発環境)

VSCode,HTML/CSS, Ruby, Ruby on Rails, JavaScript, jquery, AWS, Heroku

# cuisine DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :tweets
- has_many :comments
- has_many :likes
## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|image|text|null: false|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :likes
## likesテーブル
|Column|Type|Options|
|------|----|-------|
|date|----|-------|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
## Association
- belongs_to :tweet
- belongs_to :user

