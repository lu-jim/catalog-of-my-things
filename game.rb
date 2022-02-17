require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(published_date, multiplayer, last_played_at, archived: false)
    super(published_date, multiplayer, last_played_at, archived:)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(published_date)
  end

  def can_be_archived?
    super && (@last_played_at.year - published_date.year) > 2
  end
end
