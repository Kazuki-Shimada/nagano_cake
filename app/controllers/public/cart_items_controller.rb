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
  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      redirect_to action: :index
    else
      render 'index'
    end
  end

  def destroy_all
    current_customer.cart_item.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
