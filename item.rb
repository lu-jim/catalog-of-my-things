# frozen_string_literal: true

# class item
class Item
  attr_reader :id

  attr_accesor :genre, :author, :source, :label, :published_date
  def initialize(_archived)
    @id = :id
    @genre = :genre
    @author = :author
    @source = :source
    @label = :label
    @published_date = :published_date
  end

  def add_genre(genre)
    @genre = genre
  end

  def can_be_archived?; end

  def move_to_archive; end
end
