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
    if params[:order][:address_option] == "0"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.name = @address.name
    else

    end

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
    params.require(:order).permit(:method_of_payment, :shipping_postal_code, :shipping_address, :name)
  end
end
