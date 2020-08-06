# README

## usersテーブル

| users            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nick_name        | string     | null: false                    |
| email            | string     | null: false                    |
| password         | string     | null: false                    |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| birthday         | date       | null: false                    |

### Association
- has_many :items, through: transactions

## itemsテーブル

| items            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| image            | string     | null: false                    |
| comment          | text       | null: false                    |
| category         | references | null: false, foreign_key:true  |
| status           | references | null: false, foreign_key:true  |
| delivery_fee     | references | null: false, foreign_key: true |
| shipping_origin  | references | null: false, foreign_key: true |
| shipping_date    | references | null: false, foreign_key: true |
| price            | integer    | null: false                    |
| users_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :users, through: transactions
- has_one :shipping_addresses

## transactionsテーブル

| transactions      | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| users_id          | references | null: false, foreign_key: true |
| items_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items

## shipping_addressesテーブル

| shipping_addresses  | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | integer    | null: false                    |
| prefectures         | references | null: false, foreign_key: true |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| items_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :items