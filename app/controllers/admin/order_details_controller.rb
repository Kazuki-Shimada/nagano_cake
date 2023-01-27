class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(order_status: 2) if @order_detail.item_status == "making"

      @order_details.each do |order_detail|
        if order_detail.item_status != "finished"
          is_updated = false
        end
      end
      @order.update(order_status: 3) if is_updated
    end
    redirect_to admin_order_path(@order_detail.order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:item_status)
  end
end
