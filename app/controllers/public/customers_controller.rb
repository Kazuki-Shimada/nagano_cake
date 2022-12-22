class Public::CustomersController < ApplicationController
  def show
    @current = current_user
  end

  def edit
  end

  def confirm
  end
end
