class Admin::GenresController < ApplicationController
  before_action :is_admin, only: [:index, :edit]
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  def create
  genre = Genre.new(genre_params)
  if genre.save
    redirect_to admin_genres_path
  else
    render :index
  end
  end
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] ="You have updated book successfully."
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private

    def genre_params
      params.require(:genre).permit(:name)
    end
  def is_admin
    unless admin_signed_in?
      redirect_to root_path
    end
  end
end
