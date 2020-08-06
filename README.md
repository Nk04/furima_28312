# README

## usersテーブル

| users     | Type   | Options     |
| --------- | ------ | ----------- |
| nick_name | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

### Association
- has_one profiles
- has_one shipping_addresses
- has_one orders
- has_many items

## profilesテーブル

| profiles         | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| birthday_year    | date       | null: false                    |
| birthday_month   | date       | null: false                    |
| birthday_day     | date       | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to users

## shipping_addressesテーブル

| shipping_addresses | Type       | Options                        |
| -----------------  | ---------- | ------------------------------ |
| postal_code        | integer   | null: false                     |
| prefectures        | string     | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | integer   | null: false                     |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to users

## itemsテーブル

| items            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| image            | string     | null: false                    |
| comment          | text       | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| delivery_fee     | string     | null: false                    |
| shipping_origin  | string     | null: false                    |
| shipping_date    | string     | null: false                    |
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