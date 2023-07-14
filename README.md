# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |

# Association
- has_many :items
- has_one :card

# itemsテーブル
| Column          | Type   | Options     |
| ------          | ------ | ----------- |
| name            | string | null: false |
| image           | string | null: false |
| explain         | string | null: false |
| category        | string | null: false |
| condition       | string | null: false |
| cost            | string | null: false |
| area            | string | null: false |
| days            | string | null: false |
| price           | string | null: false |
| user_id         | string | null: false |

# Association
- belongs_to :user
- has_one :purchase

# cardテーブル
| Column    | Type   | Options     |
| ------    | ------ | ----------- |
| card_id   | string | null: false |
| user_id   | string | null: false |

# Association
- belongs_to :user

# purchaseテーブル
| Column       | Type   | Options     |
| ------       | ------ | ----------- |
| user_id      | string | null: false |
| post_cord    | string | null: false |
| prefectures  | string | null: false |
| city         | string | null: false |
| adress       | string | null: false |
| building     | string | null: false |
| phone_number | string | null: false |

# Association
- belongs_to :items