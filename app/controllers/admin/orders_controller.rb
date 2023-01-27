class Admin::OrdersController < ApplicationController
  before_action :is_admin, only: [:show]
  def show
    @order = Order.find(params[:id])
  end
  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update_all(item_status: 1) if @order.order_status == "payment_confirmed"
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
  def is_admin
    unless admin_signed_in?
      redirect_to root_path
    end
  end
end
