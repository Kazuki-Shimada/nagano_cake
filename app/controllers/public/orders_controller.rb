class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
  end

  def finish
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
  def confirm
    @cart_items = CartItem.all
    @total = 0
    @order = Order.new
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else

    end

  end
  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.price
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_finish_path
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :billing_amount)
  end
end
