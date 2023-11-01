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
| birth_y            | date   | null: false               |
| birth_m            | date   | null: false               |
| birth_d            | date   | null: false               |

### Association
-has_many :items
-has_many :orders


## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product         | string     | null: false                    |
| describe        | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| pay_shipping    | string     | null: false                    |
| ship_from       | string     | null: false                    |
| until_shipping  | string     | null: false                    |
| price           | integer    | null: false                    |
| commission      | decimal    | null: false                    |
| profit          | decimal    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
-belongs_to :user
-has_one :order


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
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
-belongs_to :order