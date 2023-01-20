class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def confirm
  end
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] ="You have updated book successfully."
      redirect_to customer_path(@customer)
    else render :edit
    end
  end
  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
