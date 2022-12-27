class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end

  def about
  end
end
