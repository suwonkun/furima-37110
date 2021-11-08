<!-- usersテーブル -->

| Column             | Type   | Options                  |
| ------------------ | ------ | ----------- -----------  |
| nickname           | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
|  last_name         | string | null: false              |
|  first_name        | string | null: false              |
|  last_name_kana    | string | null: false              |
|  first_name_kana   | string | null: false              |
|  birthday          | date   | null: false              |


<!-- Association -->
- has_many :items
- has_many :buys


<!-- itemsテーブル -->

| Column             | Type       | Options                        |
| ------------------ | ------ ----| ----------- -----------        |
| item_name          | string     | null: false                    |
| explanation        | text       | null: false,                   |
| user               | references | null: false, foreign_key: true |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| derivery_charge_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |

<!-- Association -->
- belongs_to :user
- has_one :buy



<!-- buysテーブル -->
| Column             | Type       | Options                        |
| ------------------ | ------ ----| ----------- -----------        |
| item               |references  | null: false, foreign_key: true |
| user               |references  | null: false, foreign_key: true |


<!-- Association -->
- has_one :adress
- belongs_to :item
- belongs_to :user


<!-- adressesテーブル -->
| Column             | Type       | Options                        |
| ------------------ | ------ ----| ----------- -----------        |
| postal_code        | string     | null: false                    |
| area_id            | integer    | null: false                    |
| municipalities     |references  | null: false                    |
| address            |references  | null: false                    |
| building_name      |references  | null: false                    |
| telephone_number   | string     | null: false                    |



<!-- Association -->
- belongs_to :buy

