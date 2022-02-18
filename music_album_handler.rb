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