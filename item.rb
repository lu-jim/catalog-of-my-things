require 'date'

class Item
  attr_reader :id
  attr_accessor :genre, :label, :published_date :archived

  def initialize(id:, published_date: archived: false)
    @id = :id
    @genre = []
    @author = []
    @label = []
    @published_date = Date.parse(published_date)
    @archived = archived
  end

  def add_genre(genre)
    @genre.push(genre) unless @genre.include?(genre)
  end

  def add_author(author)
    @author.push(author) unless @author.include?(author)
  end

  def add_label(label)
    @label.push(label) unless @label.include?(label)
    puts @label
  end

  def can_be_archived?
    (Date.today.year - published_date.year) > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
