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

  def to_json(_options = {})
    {
      'id' => @id,
      'published_date' => @published_date.strftime('%Y-%m-%d'),
      'genre_id' => @genre&.id,
      'author_id' => @author&.id,
      'source_id' => @source&.id,
      'label_id' => @label&.id,
      'archived' => @archived
    }
  end
end
