

class SongsController < ApplicationController

  def index
    songs = Song.create_wwoz_json_objs
    @songs = JSON.parse(songs)
    render json: @songs
  end

  def hit_byebug
    Song.searchBySongNameFilterByArtist
  end


end
