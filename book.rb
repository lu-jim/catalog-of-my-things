require './item'

class Book < Item 
  attr_reader :publisher, :cover_state, :published_date :archived

  def initialize(id:, publisher: ,cover_state:, published_date:, archived: false)
    super(id: id, publisher:, cover_state:, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end
