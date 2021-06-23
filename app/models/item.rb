class Item < ApplicationRecord
  #validates :user, presence: true, foreign_key: true
  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_location_id, presence: true
  validates :shipping_days_id, presence: true
  validates :price, presence: true

  belongs_to :user
  has_one :order
end
