require_relative 'item'
require 'json'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(name:, multiplayer:, last_played_at:, **all)
    super(**all)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    today = Date.today
    super && (today.year - @last_played_at.year) > 2
  end

  def to_hash
    { id: @id, published_date: @published_date, author: @author, archived: @archived, multiplayer: @multiplayer,
      last_played_at: @last_played_at }
  end

  def to_s
    "{ id: #{@id}, published_date: #{@published_date}, author: #{@author}, archived: #{@archived},\
multiplayer: #{@multiplayer}, last_played_at: #{@last_played_at} }"
  end
end
