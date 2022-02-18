require_relative 'item'

class MusicAlbum < Item
  attr_accessor: published_date, :on_spotify, :archived

  def initialize(id:, :published_date, archived: false, on_spotify: false)
    super(id: id, published: published_date: published_date, archived: archived)
    @on_spotify = on_spotify
  end