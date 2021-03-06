# README

# テーブル設計  

# usersテーブル
| Column             | Type   | Options                   |
|-----------------   | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | unique: true,null: false  |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| fist_name kana     | string | null: false               |
| birth_day          | date   | null: false               |

 Association

 - has_many :items
 - has_many :orders

 ## items テーブル
| Column             | Type       |  Options                       |
|------------------  | --------   | -------------------------------|                    
| name               | string     | null: false                    |
| info               | text       | null: false                    |
| price              | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_id        | integer    | null: false                    |
| shipping_status_id | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

Association
- belongs_to :user
- has_one :order


## orders テーブル
| Column        | Type       | Options                        |
|---------------| ---------- | -------------------------------|
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |



Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column           | Type        | Options                            |
|----------------- | ----------  | ---------------------------------- |
| postal_code      | string      | null: false                        |
| city             | string      | null: false                        |
| address          | string      | null: false                        |
| building         | string      |                                    |
| prefecture_id    | integer     | null: false                        |
| phone_nember     | string      | null: false                        |
| order            | references  | null: false, foreign_key: true     |

Association

- belongs_to :order