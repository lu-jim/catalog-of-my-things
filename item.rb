require 'date'
require './label_methods'
require 'securerandom'

class Item
  attr_reader :id, :author
  attr_accessor :genre, :source, :label, :published_date, :archived

  def initialize(id:, published_date:, archived: false)
    @id = id || SecureRandom.hex(4)
    @genre = []
    @author = []
    @label = []
    @published_date = Date.parse(published_date)
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre&.items&.push(self)
  end

  def add_source(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def add_label(label = nil)
    labels_manager = LabelsManager.new
    label ||= labels_manager.add_label
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def to_s
    "ID: #{@id} - Publish Date: #{@published_date} - Genre: #{@genre&.name} \
    - Source: #{@source&.name} - Label: #{@label&.name} - Archived? #{@archived}"
  end

  def to_json(_options = {})
    {
      'id' => @id,
      'published_date' => @published_date.strftime('%Y-%m-%d'),
      'genre_id' => @genre&.id,
      'source_id' => @source&.id,
      'label_id' => @label&.id,
      'archived' => @archived
    }
  end

  private

  def can_be_archived?
    (Date.today.year - published_date.year) > 10
  end
end
