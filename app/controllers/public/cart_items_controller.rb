class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id

    if @cart_item.save
      flash[:notice] ="カートに追加しました"
      redirect_to public_cart_items_path
    else
      render :index
    end
  end
  def destroy_all
    @destroy_all = current_customer.destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
