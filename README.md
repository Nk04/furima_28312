# README

## usersテーブル

| users                 | Type       | Options     |
| --------------------- | ---------- | ------------|
| nick_name             | string     | null: false |
| email                 | string     | null: false |
| family_name           | string     | null: false |
| first_name            | string     | null: false |
| family_name_kana      | string     | null: false |
| first_name_kana       | string     | null: false |
| birthday              | date       | null: false |

### Association
- has_many :item_purchases
- has_many :items, through: item_purchases

## itemsテーブル

| items               | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| image               | string     | null: false                    |
| comment             | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| delivery_fee_id     | integer    | null: false                    |
| shipping_origin_id  | integer    | null: false                    |
| shipping_date_id    | integer    | null: false                    |
| price               | string     | null: false                    |
| users               | references | null: false, foreign_key: true |

### Association
- has_one :item_purchase
- belongs_to :user, through: item_purchases
- has_one :shipping_address

## item_purchasesテーブル

| item_purchases    | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| users             | references | null: false, foreign_key: true |
| items             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## shipping_addressesテーブル

| shipping_addresses  | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefectures_id      | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| items               | references | null: false, foreign_key: true |


### Association
- belongs_to :item