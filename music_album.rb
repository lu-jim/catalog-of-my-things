require_relative 'item'

class MusicAlbum < Item
  attr_accessor: published_date, :on_spotify, :archived

  def initialize(id:, :published_date, archived: false, on_spotify: false)
    super(id: id, published: published_date: published_date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "[Music Album] #{super} - On Spotify? #{@on_spotify}"
  end