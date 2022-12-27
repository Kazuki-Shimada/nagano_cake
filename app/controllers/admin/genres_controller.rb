class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end

  def edit
  end
end
