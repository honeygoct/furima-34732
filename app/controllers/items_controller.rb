class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update,:destroy]
  before_action :set_user, only: [:edit, :update,:destroy]

  def index
    @items = Item.all.order("created_at ASC")
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

  def show
  end 

   def edit

   end

   def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
   end

  def destroy
    if @item.destroy
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:explain,:category_id,:status_id,:shipping_fee_id,:prefecture_id,:shipping_days_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

end
