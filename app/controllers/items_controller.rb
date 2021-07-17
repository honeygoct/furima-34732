class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def destroy
    item = Item.find(params[:id])
    Item.destroy
  end

end
