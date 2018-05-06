require 'nokogiri'
require 'open-uri'
require 'byebug'

class Song < ApplicationRecord

  def self.create_wwoz_json_objs
    xml = Nokogiri::XML(open("https://spinitron.com/radio/rss.php?station=wwoz"))
    arr = []
    # byebug

    xml.xpath('//channel/item').each do |song|
      # byebug
      song_obj = {}
      song_data = song.xpath('title').text.split(':')
      song_data_more = song.xpath('description').text

      str1_markerstring = " from "
      str2_markerstring = " spun at "
      str3_markerstring = "by WWOZ Programming on"
      str4_markerstring = ", "


      album = song_data_more[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
      played_time = song_data_more[/#{str2_markerstring}(.*?)#{str3_markerstring}/m, 1]
      dj = song_data_more[/#{str3_markerstring}(.*?)#{str4_markerstring}/m, 1]

      song_data[1] = song_data[1].gsub(/((?<!\w)'|'(?!\w))/, '').strip
      song_obj[:artist] = song_data[0]
      song_obj[:song_title] = song_data[1]
      song_obj[:album] = album.strip
      song_obj[:played_at] = played_time.strip
      song_obj[:dj] = dj.strip

      arr.push(song_obj)

    end
    {
      title: xml.xpath('//channel/title').first.text,
      link: xml.xpath('//channel/link').first.text,
      description: xml.xpath('//channel/description').first.text,
      lastBuildDate: xml.xpath('//channel/lastBuildDate').first.text,
      entries: arr
    }.to_json
  end


  def self.searchBySongNameFilterByArtist
    resp = RestClient.get("http://localhost:3000/",
    headers = {
    'Content-Type': 'application/json',
    'Accepts': 'application/json',
    })
    byebug
    # slugified_song_name = song_obj["title"]
    # RestClient.get(`https://api.spotify.com/v1/search?q=tania%20bowra&type=artist`)
  end

end
