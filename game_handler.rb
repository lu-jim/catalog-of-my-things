require 'json'
require_relative 'game'
require_relative 'author'
require_relative 'input'

class GameHandler
  attr_reader :games

  def initialize
    @games = read_game
  end

  def add_game
    title, published_date, is_archived, label_title, label_color, author_first_name, author_last_name = Input.item
    multiplayer, last_played_at = Input.game
    new_game = Game.new(id: nil, title:, multiplayer:, last_played_at:,
                        published_date:, genre: {}, label: {}, author: {})
    label = Label.new(title: label_title, color: label_color)
    label.add_item(new_game)
    author = Author.new(author_first_name, author_last_name)
    author.add_item(new_game)
    new_game.move_to_archive if is_archived
    @games << new_game.to_hash
    save_game
  end

  def list_games
    game_data = read_game
    games_list = game_data.map do |games|
      "id: #{games['id']}
      Game Title: #{games['title']}
      Published Date: #{games['published_date']}
      Archived: #{games['archived']}

      Author: #{games['author']}
      Label: #{games['label']}

      Multiplayer?: #{games['multiplayer']}
      Last Played at: #{games['last_played_at']}
      "
    end
    puts games_list
  end

  def read_game
    game_file = File.read('./json/games.json') if File.exist?('./json/games.json')
    game_file.nil? ? [] : JSON.parse(game_file)
  end

  def save_game
    game_data = JSON.generate(@games)
    File.write('./json/games.json', game_data)
  end
end
