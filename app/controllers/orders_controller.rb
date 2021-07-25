class OrdersController < ApplicationController

  def index
    @order = OrderAddress.new
    @item = Item.all.find(params[:item_id])

  end


  def create
     Order.create(order_params)
  end

  private

  def order_params
    params.require(:tweet).permit(:user_id, :item_id, :order_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number)
  end
  
end
