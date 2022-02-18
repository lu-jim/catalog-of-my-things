require_relative 'item'
require 'json'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id:, published_date:, multiplayer:, last_played_at:, archived: false)
    super(id, published_date:, archived:)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && (@last_played_at.year - published_date.year) > 2
  end

  def as_json(*)
    {
      id: @id,
      published_date: @published_date,
      archived: @archived,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end
