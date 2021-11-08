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
|  birthday          | integer| null: false              |


<!-- Association -->
- has_many :items
- has_many :buys


<!-- itemsテーブル -->

| Column             | Type       | Options                        |
| ------------------ | ------ ----| ----------- -----------        |
| item_name          | string     | null: false                    |
| explanation        | text       | null: false,                   |
| user               | references | null: false, foreign_key: true |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| derivery_charge    | integer    | null: false                    |
| area               | syring     | null: false                    |
| days_to_ship       | string     | null: false                    |
| price              | integer    | null: false                    |

<!-- Association -->
- belongs_to :user
- has_one :buys



<!-- buysテーブル -->
| Column             | Type       | Options                        |
| ------------------ | ------ ----| ----------- -----------        |
| item               |references  | null: false, foreign_key: true |
| user               |references  | null: false, foreign_key: true |
| adresses           |references  | null: false, foreign_key: true |


<!-- Association -->
- has_one :adress
- belong to :item


<!-- adressesテーブル -->
| Column             | Type       | Options                        |
| ------------------ | ------ ----| ----------- -----------        |
| shipping_address   | string     | null: false                    |
| postal_code        | integer    | null: false                    |
| prefectures        | text       | null: false                    |
| municipalities     |references  | null: false, foreign_key: true |
| address            |references  | null: false, foreign_key: true |
| building_name      |references  | null: false, foreign_key: true |
| telephone_number   |references  | null: false, foreign_key: true |


<!-- Association -->
- belong to :buys

