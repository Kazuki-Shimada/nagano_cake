class Public::AddressesController < ApplicationController
  def index
    
  end

  def edit
    @address = Address.new
    @addresses = Address.all
  end
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_user.id 
    if @address.save
      flash[:notice] ="You have created book successfully."
      redirect_to public_addresses_path(@address)
    else
      render :index
    end
  end
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
