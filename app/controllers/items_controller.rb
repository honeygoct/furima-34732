class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def destroy
    item = Item.find(params[:id])
    Item.destroy
  end

end
