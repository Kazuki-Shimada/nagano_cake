class Admin::HomesController < ApplicationController
  before_action :is_admin, only: [:top]
  def top
    @orders = Order.all
    @total = 0
  end
  
  private
  
  def is_admin
    unless admin_signed_in?
      redirect_to root_path
    end
  end
end
