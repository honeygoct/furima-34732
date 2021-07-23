class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all.order("created_at ASC")
    #@items = []
  end

  def new
   @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  #def destroy
    #item = Item.find(params[:id])
    #Item.destroy
  #end

  private

  def item_params
    params.require(:item).permit(:image,:name,:explain,:category_id,:status_id,:shipping_fee_id,:prefecture_id,:shipping_days_id,:price).merge(user_id: current_user.id)
  end

end
