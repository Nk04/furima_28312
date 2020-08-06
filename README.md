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
- has_one shipping_addresses
- has_many orders
- has_many items

## shipping_addressesテーブル

| shipping_addresses | Type       | Options                        |
| -----------------  | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to users

## itemsテーブル

| items            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| image            | string     | null: false                    |
| comment          | text       | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to users

## ordersテーブル

| users            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to users