require 'json'
require './genre'

class Genrehandler
  attr_reader :genres

  def initialize
    @genres = []
  end

  def save 
    File.write('json/genre.json', JSON.generate(@genres.map(&:to_json))) unless @genres.empty?
  end

  def load
    file = 'json/genre.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).map do |data|
        @genres.push(Genre.new(id: data['id'], name: data['name']))
      end
    else
      []
    end
  end

  def add_genre(genre)
    @genre.push(genre)
  end

  def create_genre
    puts ''
    puts 'Creating Genre >>>'
    print 'Name'

