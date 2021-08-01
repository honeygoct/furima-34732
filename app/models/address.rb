class Address < ApplicationRecord
  belongs_to :order


  #extend ActiveHash::Associations::ActiveRecordExtensions
  #belongs_to :prefecture

  #with_options presence: true do
    #validates :postal_code
    #validates :city
    #validates :house_number
    #validates :phone_number
  #end


  #with_options numericality: { other_than: 1 , message: "must be other than 1"}  do
    #validates :prefecture_id
  #end


end
