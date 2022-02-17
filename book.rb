require './item'

class Book < Item
  attr_reader :publisher, :cover_state, :published_date, :archived

  def initialize(id:, publisher:, cover_state:, published_date:, archived: false)
    super(id:, published_date:, archived:)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
