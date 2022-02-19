require 'json'
require_relative 'game'
require_relative 'author'

class GameHandler
  attr_reader :games

  def initialize
    games = File.read('./json/games.json') if File.exist?('./json/games.json')
    @games = games.nil? ? [] : JSON.parse(games)
    @author_manager = AuthorManager.new
  end

  def add_game
    puts 'Enter game last played date'
    last_played_at = gets.chomp
    puts 'Is it multiplayer? (Y/N)'
    is_multiplayer = gets.chomp
    multiplayer = is_multiplayer.downcase == 'y'
    puts 'Enter published date'
    published_date = gets.chomp
    puts 'Is the game archived [Y/N] ?'
    archived = gets.chomp
    is_archived = archived.downcase == 'y'
    new_game = Game.new(id: nil, last_played_at:, multiplayer:, published_date:)
    new_game.move_to_archive if is_archived
    puts 'Enter if you want to add an author to this game [Y/N] ?'
    response = gets.chomp
    if response.downcase == 'y'
      new_game_author = @author_manager.new_author
      new_game.add_author(new_game_author)
    end
    @games.push(new_game.to_hash)
    save_game
  end

  def list_games
    games_list = @games.map do |games|
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
