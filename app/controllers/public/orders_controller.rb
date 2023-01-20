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
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end
  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    if order.save
      flash[:notice] ="You have created book successfully."
      redirect_to orders_confirm_path
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
