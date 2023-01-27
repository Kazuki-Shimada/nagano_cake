class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer)
  end

  def edit
    @address = Address.find(params[:id])
  end
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] ="You have created book successfully."
      redirect_to addresses_path(@address)
    else
      render :index
    end
  end
  def destroy
    address = Address.find(params[:id])
    if address.destroy
      redirect_to action: :index
    else
      redirect_to action: :edit
    end
  end
  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      flash[:notice] ="You have updated book successfully."
      redirect_to action: :index
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
