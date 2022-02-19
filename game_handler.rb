require 'json'
require_relative 'game'

class GameHandler
  attr_reader :games

  def initialize
    games = File.read('./json/games.json') if File.exist?('./json/games.json')
    @games = games.nil? ? [] : JSON.parse(games)
  end

  def add_game
    puts 'Enter game last played date'
    last_played_at = gets.chomp
    puts 'Is it multiplayer? (y/n)'
    multiplayer = gets.chomp
    puts 'Enter published date'
    published_date = gets.chomp
    puts 'Is the game archived [Y/N] ?'
    archived = gets.chomp
    is_archived = archived.downcase == 'y'
    new_game = Game.new(id: nil, last_played_at:, multiplayer:, published_date:)
    new_game.move_to_archive if is_archived
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
    game_data = JSON.generate(games)
    File.write('./json/games.json', game_data)
  end
end