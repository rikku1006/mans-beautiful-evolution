# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

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