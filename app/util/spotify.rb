require 'rest-client'
require 'byebug'
require 'json'


class Spotify
  @@trackURIs = []

  def initialize(artist, track, album, played_at, dj)
    @artist = artist
    @artist_slug = artist.gsub(' ', '%20')
    @track = track
    @track_slug = track.gsub(' ', '%20')
    @album = album
    @played_at = played_at
    @dj = dj
  end

  def self.getAuth
  end

  def self.trackURIs
    @@trackURIs
  end

  def self.updatePlaylist
   accessToken = self.getAccessToken
   headers = { "Authorization": "Bearer #{accessToken}"}
   userId = JSON.parse(RestClient.get('https://api.spotify.com/v1/me', headers: headers))["id"]

   RestClient.post("https://api.spotify.com/v1/users/#{userId}/playlists/#{ENV["playlist_id"]}/tracks",
     {uris: Spotify.trackURIs},
     headers: headers
   )
  end

  def findTrackURI
    RestClient.get("https://api.spotify.com/v1/search?q=#{self.track_slug}&type=track")

  end

  def addTrackURIToMasterArray
    if self.findTrackURI
      @@trackURIs << self.findTrackURI
    end
  end

  def self.getTracksFromWWOZ
    JSON.parse(RestClient.get("http://localhost:3000/",
      headers = {
        'Content-Type': 'application/json',
        'Accepts': 'application/json',
        }))["entries"]
  end

end


tracks = Spotify.getTracksFromWWOZ

# tracks.each do |track|
