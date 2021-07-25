class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
  end


  with_options numericality: { other_than: 1 , message: "must be other than 1"}  do
    validates :prefecture_id
  end

  def save
    
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number)
    
  end

end