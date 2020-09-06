# README

## アプリ名

cuisine

サイトのイメージ

<!-- 画像投稿予定 -->

## App URL

url予定

ユーザー名/ sample
Eメール/ sample@sample.com
パスワード/ 55113334
新規登録も可能ですがこちらをご利用頂けたら幸いです。

##  概要

簡易料理投稿アプリになります。


##  使用方法

①上記のテスト用ユーザーでログイン
※ログインできない場合は新規で登録ください。

##  課題や今後実装したい機能

カレンダー機能を追加し投稿した記事をカレンダーの予定に追加できるようにしたい。
料理動画投稿機能の追加


## 工夫したポイント

✳︎投稿フォームで画像をアップロードする上でCarrierWaveを使用した。
デプロイの際にherokuのストレージだけでは画像の保存が少量しかできない為、
AWSのS3を使用した。

✳︎いいね機能を実装、いいねの数の多い順(上位３位)をランキング表示させました。

※投稿詳細内にメッセージ機能を入れましたがAjaxを用いて非同期通信を行いました。

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

