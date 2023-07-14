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
| Column             | Type   | Options                 |
| ------------------ | ------ | -----------             |
| nickname           | string | null: false             |
| email              | string | null: false, unique:true|
| encrypted_password | string | null: false             |
| family_name        | string | null: false             |
| first_name         | string | null: false             |
| family_name_kana   | string | null: false             |
| first_name_kana    | string | null: false             |
| date               | string | null: false             |

# Association
- has_many :items
- has_one :card

# itemsテーブル
| Column             | Type       | Options                       |
| ------             | ------     | -----------                   |
| name               | string     | null: false                   |
| explain            |  text      | null: false                   |
| category_id        | integer    | null: false                   |
| condition_id       | integer    | null: false                   |
| cost_id            | integer    | null: false                   |
| area_id            | integer    | null: false                   |
| d_day_id           | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false, foreign_key: true|

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
| Column       | Type       | Options                       |
| user         | references | null: false, foreign_key: true|
| item         | references | null: false, foreign_key: true|

# Association
- belongs_to :items
- has_one :receiver_address

# receiver_address
| Column       | Type       | Options                       |
| ------       | ------     | -----------                   |
| post_cord    | string     | null: false                   |
| area_id      | integer    | null: false                   |
| address      | string     | null: false                   |
| building     | string     |                               |
| phone_number | string     | null: false                   |

# Association
- belongs_to :purchase