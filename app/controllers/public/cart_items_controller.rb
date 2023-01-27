class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer)
    @total = 0
  end
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: @cart_item.item_id)
      @cart_item2 = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
      @cart_item2.amount += @cart_item.amount
      @cart_item2.save
    else
      @cart_item.save
    end
    redirect_to cart_items_path
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
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] ="You have updated book successfully."
      redirect_to cart_items_path(@cart_item)
    else
      render :index
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
