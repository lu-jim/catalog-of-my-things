require './book_handler'
require './game_handler'
require './label_methods'

class App
  def initialize
    @books_handler = BookHandler.new
    @albums = []
    @games = GameHandler.new
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
    list_items_choices = ['List books', 'List music albums', 'List games']
    list_items_choices.each_with_index do |choice, index|
      puts "#{index + 1}. #{choice}"
    end
    selected_option = gets.chomp.to_i
    case selected_option
    when 1
      @books_handler.list_all_books
    when 2
      puts 'list_albums'
    when 3
      @games.list_games
    when 4
      close
    else
      puts 'Select a valid option'
    end
    run
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

    @label_methods.list_all_labels if ans == 1
  end

  def add_item
    add_item_choices = ['Create book', 'Create music album', 'Create game', 'Exit']
    add_item_choices.each_with_index do |choice, index|
      puts "#{index + 1}. #{choice}"
    end
    selected_option = gets.chomp.to_i
    case selected_option
    when 1
      @books_handler.add_book
    when 2
      puts 'add_album'
    when 3
      @games.add_game
    when 4
      close
    else
      puts 'Select a valid option'
      run
    end
  end

  def close
    puts 'Thanks for using the catalog'
  end
end
