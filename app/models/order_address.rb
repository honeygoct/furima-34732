class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
    validates :user_id
    validates :item_id
    validates :prefecture_id
  end


  with_options numericality: { other_than: 1 , message: "must be other than 1"}  do
    validates :prefecture_id
  end

  def save
    
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number)
    
  end

  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/ 
  validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }


  validates :phone_number,length:{ is:11 } ,numericality: {only_integer: true}
end