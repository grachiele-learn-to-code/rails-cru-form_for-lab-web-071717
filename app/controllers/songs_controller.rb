class SongsController < ApplicationController

  def index
  end

  def create
    @song = Song.new
    @song.name = params[:song][:name]
    @song.artist_id = params[:song][:artist_id]
    @song.genre_id = params[:song][:genre_id]
    @song.save
    redirect_to song_path(@song)
  end

  def new
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.new
  end

  def edit
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(strong_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  def destroy
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def strong_params(*args)
    params.require(:song).permit(*args)
  end

end
