# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| encrypted_password     | string | null: false |
| fmily_name             | string | null: false |
| first_name             | string | null: false |
| family_name_kana       | string | null: false |
| first_name_kana        | string | null: false |
| birthday               | string | null: false |


## items テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| name           | string | null: false |
|product_image   | string | null: false |
| product_name   | string | null: false |
|description     | string | null: false |
|category        | string | null: false |
|condition       | string | null: false |
|delivery_charge | string | null: false |
|shipping_area   | string | null: false |
|days_to_ship    | string | null: false |
|price           | string | null: false |
|user_id         | string | null: false |

## purchase テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user_id   | integer    | null: false |
| item_id   | integer    | null: false |

## delivery テーブル

| Column           | Type   | Options     |
| ---------------- | -------| ------------|
| post_code        | string | null: false |
| prefectures      | string | null: false |
| city             | string | null: false |
| address          | string | null: false |
| building_name    | string |             |
| telephone_number | string | null: false |

## orders テーブル

| Column       | Type   | Options     |
| -------------| -------| ------------|
| price        | string | null: false |
