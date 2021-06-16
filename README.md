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
| Column             | Type      | Options      |
|--------------------|-----------|--------------|
|user                | reference |null:false    |
|item_name           | string    |null:false    |
|explain             | text      |null:false    |
|category_id         | integer   |null:false    |
|status_id           | integer   |null:false    |
|shipping_fee_id     | integer   |null:false    |
|shipping_location_id| integer   |null:false    |
|shipping_days_id    | integer   |null:false    |
|price               | integer   |null:false    |
### Association
- belongs_to :user
- has_one :order

# orders テーブル
| Column          | Type      | Options      |
|-----------------|-----------|--------------|
|user             | reference |null:false    |
|item             | reference |null:false    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


# Address テーブル
| Column          | Type      | Options      |
|-----------------|-----------|--------------|
|postal_code      | string    |null:false    |
|prefecture_id    | integer   |null:false    |
|city             | string    |null:false    |
|address          | string    |null:false    |
|building         | string    |              |
|phone_number     | string    |null:false    |

### Association
- belongs_to :order