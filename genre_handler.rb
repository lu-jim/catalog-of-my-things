require 'json'
require './genre'

class GenreHandler
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
    @genres.push(genre)
  end

  def create_genre
    puts ''
    puts 'Creating Genre...'
    print 'Name: '
    name = gets.chomp
    genre = Genre.new(id: nil, name: name)
    if check_if_genre_exists?(name)
      get_genre_from_name(name)
    else
      genre
    end
  end

  def list_of_genre_names
    arr = []
    @genres.each { |e| arr.push(e.name.downcase) }
    arr
  end

  def check_if_genre_exists?(name)
    if list_of_genre_names.include?(name.downcase)
      puts 'Genre is already in the list of genres'
      true
    else
      puts "Genre #{name} created!"
      false
    end
  end

  def list_genre_with_index
    if @genres.empty?
      puts 'There is no genre registered yet'
    else
      @genres.each_with_index { |genre, index| puts "#{index}) #{genre}" }
    end
  end

  def get_genre_from_index(index)
    @genres[index.to_i]
  end

  def get_genre_from_id(id)
    @genres.find { |e| e if e.id == id }
  end

  def get_genre_from_name(name)
    @genres.find { |e| e if e.name.downcase == name.downcase }
  end
end