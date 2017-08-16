class GenresController < ApplicationController

  def index
  end

  def create
    @genre = Genre.new
    @genre.name = params[:genre][:name]
    @genre.save
    redirect_to genre_path(@genre)
  end

  def new
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(strong_params(:name))
    redirect_to genre_path(@genre)
  end

  def destroy
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private

  def strong_params(*args)
    params.require(:genre).permit(*args)
  end

end
