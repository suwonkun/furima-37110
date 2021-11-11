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
| explanation        | text       | null: false                    |
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
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | string     | null: false                    |
| buy                |references  | null: false, foreign_key: true |


<!-- Association -->
- belongs_to :buy


**herokuに変更を反映**
`% git push heroku master`

`% heroku run rails db:migrate`

`% heroku apps:info`
