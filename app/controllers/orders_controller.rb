class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_params
  before_action :sold_out_item, only: [:index,:create]

  def index
    @order = OrderAddress.new
  end


  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end

  end

  private

  def order_params
    params.require(:order_address).permit(:order_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id:params[:item_id],token: params[:token])
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    if @item.order.present? || current_user.id == @item.user_id
    redirect_to root_path 
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    
      currency: 'jpy'             
    )
  end


  
end
