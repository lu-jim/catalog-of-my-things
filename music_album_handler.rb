require 'json'
require './music_album'
require './genre_handler'
require './translate'

def MusicAlbumHandler
  include Translate
  attr_reader :music_albums

  def initialize 
    @music_albums = []
  end

  def save 
    File.write('json/music_album.json', JSON.generate(@music_albums.map(&:to_json))) unless @music_albums.empty?
  end

  def load(genre_handler)
    file = 'json/music_album.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).map do |data|
        music_album = MusicAlbum.new(id: data['id'], published_date: data['published_date'])
        music_album.add_genre(genre_handler.get_genre_from_id(data['genre_id']))
        @music_albums.push(music_album)
      end
    else
      []
    end
  end