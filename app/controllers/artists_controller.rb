class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def create
    @artist = Artist.new
    @artist.name = params[:artist][:name]
    @artist.bio = params[:artist][:bio]
    @artist.save
    redirect_to artist_path(@artist)
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(strong_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  def destroy
  end

  def show
    @artist = Artist.find(params[:id])
  end

  private

  def strong_params(*args)
    params.require(:artist).permit(*args)
  end

end
