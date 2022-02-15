# テーブル設計

## users テーブル

| Column                 | Type   | Options                  |
| ---------------------- | ------ | ------------------------ | 
| nickname               | string | null: false              |
| email                  | string | null: false, unique:true |
| encrypted_password     | string | null: false              |
| family_name            | string | null: false              |
| first_name             | string | null: false              |
| family_name_kana       | string | null: false              |
| first_name_kana        | string | null: false              |
| birthday               | data   | null: false              |
--------------------------------------------------------------
| Association            |
| has_many :items        |
| has_many :purchases    |




## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
--------------------------------------------------------------------
| Association            |
| belongs_to :user       |
| has_one :purchase      |

## purchases テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| user      | references | null: false, foreign_key: true|
| item      | references | null: false, foreign_key: true|
----------------------------------------------------------
| Association            |
| has_one :delivery      |
| belongs_to :user       |
| belongs_to :item       |


## deliverys テーブル

| Column           | Type       | Options                       |
| ---------------- | -----------| ------------------------------|
| post_code        | string     | null: false                   |
| prefecture_id    | integer    | null: false                   |
| city             | string     | null: false                   |
| address          | string     | null: false                   |
| building_name    | string     |                               |
| telephone_number | string     | null: false                   |
| purchases        | references | null: false, foreign_key: true|
------------------------------------------------------------------
| Association            |
| belongs_to :purchase   |
