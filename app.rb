require './music_album_handler'
require './genre_handler'
require './book_handler'
require './label_methods'

class App
  def initialize
    @books_handler = BookHandler.new
    @music_album_handler = MusicAlbumHandler.new
    @genre_handler = GenreHandler.new
    @label_methods = LabelsManager.new
  end

  def run
    @options = ['List items', 'List categories', 'Add Item', 'Exit']
    @options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end

    selected_option = gets.chomp.to_i - 1
    case selected_option
    when 0
      list_items
    when 1
      list_categories
    when 2
      add_item
    when 3
      close
    else
      puts 'Select a valid option'
      run
    end
  end

  def list_items
    list_items_choices = [
      'List books',
      'List music albums',
      'List games'
    ]
    list_items_choices.each_with_index do |choice, index|
      puts "#{index + 1}. #{choice}"
    end
    answer = gets.chomp.to_i
    case answer
    when 1
      puts 'listing books'
    when 2
      puts "listing music albums bb"
    when 3 
      puts 'listing games'
    end
  end

  def list_categories
    list_categories_choices = [
      'List labels',
      'List genres',
      'List authors'
    ]
    list_categories_choices.each_with_index do |choice, index|
      puts "#{index + 1}. #{choice}"
    end
    ans = gets.chomp.to_i
    case ans
    when 1
      puts 'listing labels @bun'
    when 2 
      puts 'listing genre @bun'
    when 3 
      puts 'listing authors @bun'
    end
  end

  def add_item
    add_item_choices = [
      'Create book',
      'Create music album',
      'Create game'
    ]
    add_item_choices.each_with_index do |choice, index|
      puts "#{index + 1}. #{choice}"
    end
    ans = gets.chomp.to_i
    case ans
    when 1
      puts 'creating book @bun'
    when 2 
      puts 'creating music bhama'
    when 3
      puts 'creating games @bun'
    end
  end

  def close
    puts 'Thanks for using the catalog'
  end
end
