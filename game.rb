require_relative 'item'
require 'json'

class Game < Item
  attr_accessor :title, :multiplayer, :last_played_at

  def initialize(title:, multiplayer:, last_played_at:, **all)
    super(**all)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    today = Date.today
    super && (today.year - @last_played_at.year) > 2
  end

  def to_hash
    { id: @id, title: @title, published_date: @published_date, archived: @archived, author: @author, label: @label,
      multiplayer: @multiplayer, last_played_at: @last_played_at }
  end
end
