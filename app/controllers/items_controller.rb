class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
   @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    Item.destroy
  end

  private

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
