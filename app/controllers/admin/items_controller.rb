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
    item = Item.new(item_params)
    if item.save
      redirect_to :action => "index"
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
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :price, genre_ids: [])
  end
  def article_params
    params.require(:article).permit(:body, genre_ids: [])
  end
end
