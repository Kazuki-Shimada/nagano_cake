class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_admin_item_path
    else
      render :new
    end
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
  def article_params
    params.require(:article).permit(:body, genre_ids: [])
  end
end
