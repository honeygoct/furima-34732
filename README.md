# テーブル設計
## users テーブル
| Column           | Type      | Options                 |
|------------------|-----------|-------------------------|
|nickname          | string    |null:false               |
|email             | string    |null:false,nuique:true   |
|encrypted_password| string    |null:false               |
|last_name         | string    |null:false               |
|first_name        | string    |null:false               |
|last_name_kana    | string    |null:false               |
|first_name_kana   | string    |null:false               |
|birthday          | date      |null:false               |
### Association
- has_many :items
- has_many :orders

## items テーブル
| Column          | Type      | Options      |
|-----------------|-----------|--------------|
|item name        | string    |null:false    |
|explain          | string    |null:false    |
|category         | string    |null:false    |
|status           | string    |null:false    |
|shipping fee     | string    |null:false    |
|shipping location| string    |null:false    |
|shipping days    | string    |null:false    |
|price            | integer   |null:false    |
### Association
- belongs_to :users
- has_many :orders

# orders テーブル
| Column          | Type      | Options      |
|-----------------|-----------|--------------|
|card number      | integer   |null:false    |
|validated data m | integer   |null:false    |
|validated data y | integer   |null:false    |
|security code    | integer   |null:false    |
|postal code      | integer   |null:false    |
|prefecture       | string    |null:false    |
|city             | string    |null:false    |
|address          | string    |null:false    |
|building         | string    |              |
|phone number     | string    |null:false    |

### Association

- belongs_to :users
- belongs_to :items