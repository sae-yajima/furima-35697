# README

# テーブル設計  

# usersテーブル
| Column           | Type   | Options     |
|----------------- | ------ | ----------- |
| nicname          | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| fist_name kana   | string | null: false |
| birth_day        | date   | null: false |

 Association

 - has_many :items
 - has_many :orders

 ## items テーブル
| Column             | Type       |  Options                       |
|------------------  | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| info               | text       | null: false                    |
| price              | integer    | null: false                    |
| prefecture_id      | references | null: false, foreign_key: true |
| delivery_id        | references | null: false, foreign_key: true |
| shipping_status_id | references | null: false, foreign_key: true |
| status_id          | references | null: false, foreign_key: true |
| category_id        | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |

Association
- belongs_to :users
- has_one :orders

## orders テーブル
| Column        | Type   | Options                            |
|---------------| ------ | ---------------------------------- |
| items_id      | references | null: false, foreign_key: true |
| user_id       | references | null: false, foreign_key: true |

Association

- has_one :items
- belongs_to :users
- belongs_to :asddresses

## addresses テーブル

| Column           | Type       | Options                            |
|----------------- | ---------- | ---------------------------------- |
| postal_code      | string     | null: false                        |
| city             | string     | null: false                        |
| address          | string     | null: false                        |
| building         | string     | null: false                        |
| prefecture_id    | references | null: false, foreign_key: true     |
| phone_nember     | string     | null: false                        |

Association

- belongs_to :orders