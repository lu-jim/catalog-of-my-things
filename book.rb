require './item'

class Book < Item
  attr_accessor :title, :publisher, :cover_state

  def initialize(title:, publisher:, cover_state:, **all)
    super(**all)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_hash
    { id: @id, title: @title, published_date: @published_date, archived: @archived, author: @author, label: @label,
      publisher: @publisher, cover_state: @cover_state }
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
