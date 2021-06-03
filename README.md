# README
# アプリ名
man's beautiful evolution
# 概要
このアプリケーションでは、自分の使用したスキンケア商品のレビューを、ユーザー登録をする事で、写真付きで投稿する事が出来、その投稿を投稿者は編集、削除、投稿者以外はその商品にコメントをする事が出来ます。
# 本番環境
https://mans-beautiful-evolution.herokuapp.com/
# テスト用アカウント
- ニックネーム
r
- メールアドレス
r@e-mail
- パスワード
1q2w3e
### Basic認証
- ユーザー名
rrrr
- パスワード
1111
# 利用方法
レビュー商品を投稿する際は、画面左上の新規登録から登録をし、登録後新規登録と同じ箇所に,レビュー投稿が出てくるので、そちらをクリックしレビューを投稿する事が出来ます。また、投稿したレビュー商品は、ホームページの商品レビュー一覧に表示され、表示されている商品をクリックすると、商品詳細画面へ遷移します。そこで、レビュー商品をより詳しく見る事が出来、投稿者はこの画面で、投稿の編集や削除をする事が出来、投稿者以外は、コメントをする事が出来ます。ログアウト、ログインに関しても、画面左上からする事が可能です。
# 目指した課題解決
スキンケアをしている男性が増えてきている中、女性のスキンケアサイトや、商品レビュー動画などは多くありますが、男性用のスキンケアサイトや、商品レビュー動画などは少なく、商品を参考に出来るツールが少ないと感じました。そこで、新しいスキンケア商品を探している方、これからスキンケアを始める方に、参考になるツールを増やしたいと思いこのアプリを開発しました。
# 洗い出した要件
- ユーザー管理
- レビュー商品投稿
- レビュー商品一覧表示
- レビュー商品詳細表示
- 商品編集
- 商品削除
- コメント機能
- Basic認証
# DEMO
### トップページ
[![Image from Gyazo](https://i.gyazo.com/c80068637d2d6fb9465b7e77e963ff88.jpg)](https://gyazo.com/c80068637d2d6fb9465b7e77e963ff88)
### トップページ(ログイン)
[![Image from Gyazo](https://i.gyazo.com/2ab172424cacf7af47e94abed9c656e0.jpg)](https://gyazo.com/2ab172424cacf7af47e94abed9c656e0)
トップページは、投稿されたレビュー商品が、商品レビュー一覧に表示されその商品をクリックする事で、レビュー商品の詳細ページに遷移します。また、画面左上から、ログイン、新規登録ログイン後は、ログアウト、レビュー投稿画面へクリックする事で、遷移する事が出来ます。
### 新規登録画面
[![Image from Gyazo](https://i.gyazo.com/a451c37655be2085e6ff1627aacfe61d.png)](https://gyazo.com/a451c37655be2085e6ff1627aacfe61d)
ニックネーム、メールアドレス、パスワードを入力する事で、新規登録が出来ます。
### ログイン画面
[![Image from Gyazo](https://i.gyazo.com/30a3ea58f5a67df8645c9bcc517cfe42.png)](https://gyazo.com/30a3ea58f5a67df8645c9bcc517cfe42)
登録したメールアドレス、パスワードを入力する事で、ログイン出来ます。
### レビュー投稿画面
[![Image from Gyazo](https://i.gyazo.com/0473c5093278dff1338296fc1237dfaa.png)](https://gyazo.com/0473c5093278dff1338296fc1237dfaa)
画像を選択、商品名、カテゴリーに関しては、選択肢の中から該当する分類を選択し、レビューコメントを記入する事で、投稿する事が出来ます。
### レビュー商品詳細画面
[![Image from Gyazo](https://i.gyazo.com/d95ed8551488db2ff87dfc6cbc4ebc5b.gif)](https://gyazo.com/d95ed8551488db2ff87dfc6cbc4ebc5b)
### レビュー商品詳細画面(投稿者画面)
[![Image from Gyazo](https://i.gyazo.com/2f25181752990a579d4f569935e7a167.gif)](https://gyazo.com/2f25181752990a579d4f569935e7a167)
詳細ページは、レビュー商品の写真、投稿者名、レビュー商品名、カテゴリー、レビューコメントを表示しています。また、画面下のコメントフォームから、コメントする事が可能です。投稿者画面には、レビュー商品編集、削除ボタンが表示され、そこから編集、削除する事が出来ます。
### レビュー商品編集画面
[![Image from Gyazo](https://i.gyazo.com/237e2dda4e626aa6d9524e78b16eccd2.png)](https://gyazo.com/237e2dda4e626aa6d9524e78b16eccd2)
投稿した、写真、商品名、カテゴリー、レビューコメントを編集する事が出来ます。
# 実装予定機能
- 検索機能
# DB設計
## ER図
[![Image from Gyazo](https://i.gyazo.com/fcb7e0feb6d13cbf7a2fdfebc34f0178.png)](https://gyazo.com/fcb7e0feb6d13cbf7a2fdfebc34f0178)
## users

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association
- has_many :product_reviews
- has_many :comments

## product_reviews

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| product_name   | string     | null: false       |
| category_id    | integer    | null: false       |
| review_comment | text       | null: false       |
| user           | references | foreign_key: true |


### Association
- belongs_to :user
- has_many :comments

## comments

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| text           | text       | null: false       |
| user           | references | foreign_key: true |
| product_review | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product_review
# 使用技術
## バックエンド
Ruby(6.0.0),Ruby on Rails
## フロントエンド
HTML,CSS
## データベース
MySQL,SequelPro
## インフラ
AWS(S3)
## Webサーバ(本番環境)
Heroku
## アプリケーション(本番環境)
Heroku
## ソース管理
GitHub,GitHubDesktop
## テスト
RSpec
## エディタ
VSCode
## パッケージ
- rspec-rails(4.0.0)
- factory_bot_rails(6.1.0)
- faker(2.15.1)
- devise(4.8.0)
- pry-rails(0.3.9)
- mini_magick(4.11.0)
- image_processing(1.2)
- active_hash(3.1.0)
- aws-sdk-s3(1.95.1)