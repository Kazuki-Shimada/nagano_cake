class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
  end

  def finish
  end

  def index
  end

  def show
  end
  def confirm
    @cart_items = CartItem.all
    @total = 0
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :address_id)
  end
end
