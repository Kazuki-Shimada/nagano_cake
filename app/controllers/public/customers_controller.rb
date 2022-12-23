class Public::CustomersController < ApplicationController
  def show
    @customer = current_user
  end

  def edit
  end

  def confirm
  end
  
  def withdrawal
  end
  def update
    @customer = current_user
    if @user.update(customer_params)
      flash[:notice] ="You have updated book successfully."
    else render 'edit'
    end
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
    
end
