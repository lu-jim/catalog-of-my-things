require 'json'
require_relative 'game'

class GameHandler
  attr_reader :games

  def initialize
    games = File.read('./json/games.json')
    @games = games == '' ? [] : JSON.parse(games)
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
    @games.push(new_game)
    save_game
  end

end
