class Public::ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end