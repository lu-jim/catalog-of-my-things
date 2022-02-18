require 'json'
require './music_album'
require './genre_handler'
require './translate'

class MusicAlbumHandler
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

  def add_music_album(music_album)
    @music_albums.push(music_album)
  end

  def create_music_album(genre_handler)
    puts ''
    puts 'Creating Music Album...'
    print 'Published date: '
    published_date = gets.chomp
    print 'On Spotify? [Y/N]: '
    on_spotify = gets.chomp
    print 'Archived? [Y/N]: '
    archived = gets.chomp
    music_album = MusicAlbum.new(id: nil, published_date: published_date, on_spotify: translate_input(on_spotify))
    if translate_input(archived)
      music_album.move_to_archive
      puts "It wasn't possible to archive this Music Album" if translate_input(archived) != music_album.archived
    end
    puts "1) Create a new genre to use \n2) List and use an existing genre\n3) Create without genre"
    option = gets.chomp
    genre = prompt_genre(option, genre_handler)
    music_album.add_genre(genre)
    genre_handler.add_genre(genre) unless genre_handler.genres.include?(genre)
    @music_albums.push(music_album)
    puts 'Music Album created!'
  end

  def prompt_genre(option, genre_handler)
    case option
    when '1'
      genre_handler.create_genre
    when '2'
      genre_handler.list_genre_with_index
      genre_index = gets.chomp
      genre_handler.get_genre_from_index(genre_index)
    when '3'
      puts 'Creating Music Album without genre'
      nil
    else
      puts 'Invalid option, aborting genre creation'
    end
  end
end