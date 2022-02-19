require 'json'
require_relative 'game'
require_relative 'author'
require_relative 'input'

class GameHandler
  attr_reader :games

  def initialize
    games = File.read('./json/games.json') if File.exist?('./json/games.json')
    @games = games.nil? ? [] : JSON.parse(games)
    @author_manager = AuthorManager.new
    @inputs = Input
  end

  def add_game
    name, published_date, is_archived, label_title, label_color, author_first_name, author_last_name = Input.item
    multiplayer, last_played_at = Input.game
    new_game = Game.new(name:, multiplayer:, last_played_at:, published_date:, label:{}, author:{})
    label = Label.new(label_title:, label_color:)
    author = Author.new( author_first_name:, author_last_name:)
    new_game.move_to_archive if is_archived
    
    @games.push(new_game.to_hash)
    puts new_game.to_hash
    save_game
  end

  def list_games
    game_file = File.read('./json/games.json') if File.exist?('./json/games.json')
    game_data = game_file.nil? ? [] : JSON.parse(game_file)
    games_list = game_data.map do |games|
      "id: #{games['id']}
      Published Date: #{games['published_date']}
      Author: #{games['author']}
      Archived: #{games['archived']}
      Multiplayer?: #{games['multiplayer']}
      Last Played at: #{games['last_played_at']}
      "
    end
    puts games_list
  end

  def save_game
    game_data = JSON.generate(@games)
    File.write('./json/games.json', game_data)
  end

  def link_author(game)
    puts 'Enter if you want to add an author to this game [Y/N] ?'
    response = gets.chomp
    return unless response.downcase == 'y'

    game.add_author
  end
end
