class Admin::ItemsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end
  def create
    @item = Item.new(item_params)
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] ="You have updated book successfully."
    else
      render :edit
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :genre, :price, :status)
  end
end
