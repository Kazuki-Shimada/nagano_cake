class Admin::ItemsController < ApplicationController
  before_action :is_admin, only: [:index, :new, :show, :edit]
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_item_path(item)
    else
      render :new
    end
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] ="You have updated book successfully."
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end
  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to action: :index
    else
      render 'index'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :genre_id, :is_active)
  end
  def is_admin
    unless admin_signed_in?
      redirect_to root_path
    end
  end
end
