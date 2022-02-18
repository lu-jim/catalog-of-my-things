require 'json'
require_relative 'game'

class GameHandler
  attr_reader :games

  def initialize
    games_data = File.read('./json/games.json') if File.exist?('./json/games.json')
    games = JSON.parse!(games_data)
    @games = if games.nil?
               []
             else
               games.each do |game|
                 JSON.parse!(game)
               end
             end
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
    book.move_to_archive if is_archived
    @games.push(new_game.to_s)
    save_game
  end

  def list_games
    games_list = @games.map | games | "
      id: #{games['id']}
      Published Date: #{games['published_date']}
      Author: #{games['author']}
      Archived: #{games['archived']}
      Multiplayer?: #{games['multiplayer']}
      Last Played at: #{games['last_played_at']}
      "

    puts games_list
  end

  def save_game
    File.write('./json/games.json', @games)
  end
end
