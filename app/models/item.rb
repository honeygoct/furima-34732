class Item < ApplicationRecord
  #validates :user, presence: true, foreign_key: true
  
  with_options presence: true do
  validates :name
  validates :text
  validates :category_id
  validates :status_id
  validates :prefecture_id
  validates :shipping_location_id
  validates :shipping_days_id
  validates :price
  end
  
  belongs_to :user
  #has_one :order
  has_one_attached :image
end
