require_relative 'item'

class MusicAlbum < Item
  attr_accessor: published_date, :on_spotify, :archived

  def initialize(id:, :published_date)