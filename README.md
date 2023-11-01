# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association
-has_many :items
-has_many :orders


## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| product           | string     | null: false                    |
| describe          | text       | null: false                    |
| category_id       | integer    | null: false                    |
| status_id         | integer    | null: false                    |
| pay_shipping_id   | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| until_shipping_id | integer    | null: false                    |
| price             | integer    | null: false                    |
| commission        | decimal    | null: false                    |
| profit            | decimal    | null: false                    |
| user              | references | null: false, foreign_key: true |
### Association
-belongs_to :user
-has_one :order
### ActiveHash::Associations
-belongs_to :category
-belongs_to :status
-belongs_to :pay_shipping
-belongs_to :prefecture
-belongs_to :until_shipping


## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
-belongs_to :user
-belongs_to :item
-has_one :address


## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
-belongs_to :order
### ActiveHash::Associations
-belongs_to :prefecture